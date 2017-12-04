class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def send_mail
    UsersMailer.inform_todolist(current_user.id, @todo_list.id, @todo_list.title, @todo_list.description, params[:action]).deliver_later
  end

  private

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
