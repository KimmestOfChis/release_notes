class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name,:email, :password, :password_confirmation, :role) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:email, :password, :password_confirmation, :role) }
  end
  
  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
end
