class AppHomeController < ApplicationController
  def home
    if current_user.workspaces.any?
      # TODO fix this!
      # go to user's default workspace
    else
      redirect_to no_workspace_path
    end
  end
end
