class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PublicActivity::StoreController
  hide_action :current_user

  def after_sign_in_path_for(resource)  #redirect to dashboard after successful sign in
  # welcome_index_path
  root_path
  end

end
