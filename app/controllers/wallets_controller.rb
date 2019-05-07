class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :edit, :update]
  before_action :set_owning_workspace, only: [:index]

  def new
  end

  def show
  end

  def index
    @wallets = @workspace.wallets
  end

  def edit
  end

  def update
    if @wallet.update_attributes wallet_params
      flash[:success] = "Wallet info updated!"
      redirect_to @wallet
    else
      render 'edit'
    end
  end

  private

    def set_wallet
      this_wallet = Wallet.find(params[:id])
      # ensure wallet belongs to workspace of which user is a member
      authenticate_user_membership this_wallet.workspace
      @wallet = this_wallet
      # TODO: figure out how to avoid writing to db if already current workspace
      # TODO: change current workspace management from db to session/memory
      current_user.user_profile.update(current_workspace: @wallet.workspace)
    end

    def set_owning_workspace
      this_workspace = Workspace.find(params[:workspace_id])
      authenticate_user_membership this_workspace
      @workspace = this_workspace
      # TODO: figure out how to avoid writing to db if already current workspace
      # TODO: change current workspace management from db to session/memory
      current_user.user_profile.update(current_workspace: @workspace)
    end

    def wallet_params
      params.require(:wallet).permit(:name)
    end

end
