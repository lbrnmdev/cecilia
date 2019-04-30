class WorkspacesController < ApplicationController
  before_action :ensure_user_profile_present!
  before_action :set_workspace, only: [:show]
  # TODO: before_action that checks privilages before edit, update, destroy

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new workspace_params
    if @workspace.save
      Membership.create(workspace: @workspace, user: current_user, workspace_creator: true, workspace_admin: true)  # make current_user creator and admin of this workspace
      current_user.user_profile.current_workspace = @workspace  # set workspace as user's current workspace
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

    # TODO: move this to application controller and call before going to root if user has current_workspace set?
    # def authenticate_user_membership this_workspace
    #   unless this_workspace.users.include? current_user
    #     flash[:error] = "Error ____: Not a member. Workspace id: #{this_workspace.id}"
    #     redirect_to authenticated_root_url #TODO: replace this with workspace selection page
    #   end
    # end

    def set_workspace
      @workspace = Workspace.find(params[:id]) # FIXME: maybe not wise to pass result of find to @ variable
      authenticate_user_membership @workspace

      # make this user's current workspace
      # TODO: figure out how to avoid writing to db if already current workspace
      current_user.user_profile.update(current_workspace: @workspace)
    end

    # TODO: method to check user privilages regarding editing, destroying etc

    def workspace_params
      params.require(:workspace).permit(:name, :description)
    end
end
