class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  def new
    # if user has already existing profile
    if current_user.user_profile
      # currently redirect to home page
      # TODO dunno... show alert? return html response code?
      # TODO make a damn table of in-system errors
      logger.warn {"new profile request by user:#{current_user.id} with already existing profile"}
      flash[:error] = "Something went wrong. Error#_____"
      redirect_to authenticated_root_path
    else
      @user_profile = current_user.build_user_profile
    end
  end

  def create
    # FIXME change this to build_user_profile
    @user_profile = current_user.build_user_profile(user_profile_params)
    if @user_profile.save
      flash[:success] = "Your profile's been created!"
      if current_user.memberships.any?
        redirect_to authenticated_root_url
      else
        redirect_to new_workspace_path
      end
    else
      render 'new'
    end
  end

  private

    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
      authenticate_resource_ownership @user_profile.user
    end

    def user_profile_params
      params.require(:user_profile).permit(:firstname, :lastname, :phone)
    end

end
