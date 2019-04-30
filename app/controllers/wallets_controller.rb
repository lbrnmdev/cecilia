class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show]

  def new
  end

  def show
  end

  def index
  end

  def edit
  end

  private

    def set_wallet
      this_wallet = Wallet.find(params[:id])
      # ensure wallet belongs to workspace of which user is a member
      authenticate_user_membership this_wallet.workspace
      @wallet = this_wallet
    end

end
