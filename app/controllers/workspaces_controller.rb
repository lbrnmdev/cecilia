class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show]
  # TODO: before_action that checks privilages before edit, update, destroy

  def new
    @workspace = current_user.workspaces.build
  end

  def create
    @workspace = current_user.workspaces.build(workspace_params)
    if @workspace.save
      flash[:success] = "Workspace: #{@workspace.name} created."
      redirect_to @workspace
    else
      render 'new'
    end
  end

  def show
  end

  def no_workspace
  end

  private

    def authenticate_user_membership this_workspace
      unless this_workspace.users.include? current_user
        flash[:error] = "Error ____: Not a member. Workspace id: #{this_workspace.id}"
        redirect_to authenticated_root_url #TODO: replace this with workspace selection page
      end
    end

    def set_workspace
      @workspace = Workspace.find(params[:id])
      authenticate_user_membership @workspace
    end

    # TODO: method to check user privilages regarding editing, destroying etc

    def workspace_params
      params.require(:workspace).permit(:name, :description)
    end
end
