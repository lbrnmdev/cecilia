class MembershipsController < ApplicationController
  def new
    @membership = current_user.memberships.new
  end

  # TODO: clean this whole thing up
  def create
    @membership = current_user.memberships.new
    workspace = Workspace.find_by(sign_up_code: params[:sign_up_code])
    if workspace
      @membership.workspace = workspace
      if @membership.save
        flash[:success] = "Successfully joined #{workspace.name}"
        redirect_to workspace
      elsif Membership.find_by(user: current_user, workspace: workspace)
        flash.now[:error] = "You already belong to this workspace."
        render 'new'
      else
        flash.now[:error] = "Error #: ____"
        render 'new'
        console
      end
    else
      flash.now[:error] = "Sign up code is invalid."
      render 'new'
    end
  end
end
