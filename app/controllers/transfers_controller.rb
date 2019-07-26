class TransfersController < ApplicationController
  before_action :set_owning_disbursement, only: [:index, :new, :create]

  def new
    @transfer = @disbursement.transfers.new
  end

  def create
    @transfer = @disbursement.transfers.new transfer_params
    if @transfer.save
      redirect_to @disbursement
    else
      render 'new'
    end
  end

  private

    def set_owning_disbursement
      this_disbursement = Disbursement.find(params[:disbursement_id])
      authenticate_user_membership this_disbursement.wallet.workspace
      @disbursement = this_disbursement
      # TODO: figure out how to avoid writing to db if already current workspace
      # TODO: change current workspace management from db to session/memory
      current_user.user_profile.update(current_workspace: @disbursement.wallet.workspace)
    end

    def transfer_params
      params.require(:transfer).permit(:beneficiary_name, :msisdn, :amount)
    end
end
