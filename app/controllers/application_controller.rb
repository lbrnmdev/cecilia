class ApplicationController < ActionController::Base
  before_action :authenticate_user! # ensure user is logged in for all actions

  private

    # check if resource belongs to current user
    def authenticate_resource_ownership resource_user
      if current_user != resource_user
        flash[:error] = "Not authorized to perform this action!"
        redirect_to authenticated_root_url
      end
    end

    # ensure user has user profile
    def ensure_user_profile_present!
      if current_user.user_profile.nil?
        flash[:notice] = "Complete your profile info."
        redirect_to new_user_profile_path
      end
    end
end
