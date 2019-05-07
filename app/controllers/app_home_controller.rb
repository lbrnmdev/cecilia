class AppHomeController < ApplicationController
  before_action :ensure_user_profile_present!

  # TODO: Clean this up, move logic into private method or user_profile model maybe?
  # TODO: Perhaps rather replace this with an actual home page?!
  def home
    if current_user.workspaces.none?
      redirect_to no_workspace_path
    else
      if current_user.user_profile.current_workspace
        redirect_to current_user.user_profile.current_workspace
      else
        current_user.user_profile.update(current_workspace: current_user.workspaces.first)
        redirect_to current_user.user_profile.current_workspace
      end
    end
  end

end
