class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show]
  # TODO: before_action that checks privilages before edit, update, destroy

  def new
    @workspace = current_user.workspaces.build
  end

  def create
    @workspace = current_user.workspaces.build(workspace_params)
    if @workspace.save
      flash[:success] = "You've created workspace: #{@workspace.name}!"
      redirect_to authenticated_root_url # TODO change this to workspace show
    else
      render 'new'
    end
  end

  private

    def set_workspace
      @workspace = Workspace.find(params[:id])
      # TODO: authenticate user membership
    end

    # TODO: method to check user privilages regarding editing, destroying etc

    def workspace_params
      params.require(:workspace).permit(:name, :description)
    end
end
