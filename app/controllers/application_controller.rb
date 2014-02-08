class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:followers, :following) }
      devise_parameter_sanitizer.for(:sign_up) << [:name, :occupation, :interests]
      devise_parameter_sanitizer.for(:account_update) << [:name, :occupation, :interests]
    end

end
