class DisbursementsController < ApplicationController
  before_action :set_disbursement, only: [:show, :edit, :update, :process_disbursement]
  before_action :set_owning_wallet, only: [:index, :new, :create]

  def new
    @disbursement = @wallet.disbursements.new
  end

  def create
    @disbursement = @wallet.disbursements.new disbursement_params
    if @disbursement.save
      redirect_to @disbursement
    else
      render 'new'
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def process_disbursement
    ProcessDisbursementWorker.perform_async @disbursement.id
    # flash[:notice] = "Processing disbursements..."
    # redirect_to @disbursement
    # FIXME: this returns a 204 no content
  end

  private

    def set_disbursement
      this_disbursement = Disbursement.find(params[:id])
      # ensure disbursement belongs to workspace of which user is a member
      authenticate_user_membership this_disbursement.wallet.workspace
      @disbursement = this_disbursement
      # TODO: figure out how to avoid writing to db if already current workspace
      # TODO: change current workspace management from db to session/memory
      current_user.user_profile.update(current_workspace: @disbursement.wallet.workspace)
    end

    def set_owning_wallet
      this_wallet = Wallet.find(params[:wallet_id])
      authenticate_user_membership this_wallet.workspace
      @wallet = this_wallet
      # TODO: figure out how to avoid writing to db if already current workspace
      # TODO: change current workspace management from db to session/memory
      current_user.user_profile.update(current_workspace: @wallet.workspace)
    end

    def disbursement_params
      params.require(:disbursement).permit(:description)
    end
end
