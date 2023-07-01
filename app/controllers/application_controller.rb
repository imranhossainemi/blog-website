class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
