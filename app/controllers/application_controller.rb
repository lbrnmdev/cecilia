class ApplicationController < ActionController::Base
  # ensure user is logged in for all actions
  before_action :authenticate_user!
end
