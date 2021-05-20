class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized
  skip_before_action :authorized, only: :welcome

  def welcome; end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def authorized
    redirect_to root_path, notice: 'You need to be logged in to access that page' unless current_user
  end
end
