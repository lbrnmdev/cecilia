class ApplicationController < ActionController::Base
  # ensure user is logged in for all actions
  before_action :authenticate_user!

  private

    # check if resource belongs to current user
    def authenticate_resource_ownership resource_user
      if current_user != resource_user
        flash[:error] = "Not authorized to perform this action!"
        redirect_to authenticated_root_url
      end
    end
end
