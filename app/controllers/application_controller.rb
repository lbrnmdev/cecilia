class ApplicationController < ActionController::Base
  before_action :authenticate_user! # ensure user is logged in for all actions

  # override default devise behavior
  # force redirection to new profile creation if user doesn't have a profile yet
  def after_sign_in_path_for resource
    if resource.is_a?(User) && resource.user_profile.nil?
      new_user_profile_path
    else
      super
    end
  end

  private

    # check if resource belongs to current user
    def authenticate_resource_ownership resource_user
      if current_user != resource_user
        flash[:error] = "Not authorized to perform this action!"
        redirect_to authenticated_root_url
      end
    end
end
