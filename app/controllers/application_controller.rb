class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability ||= current_doctor ? DoctorAbility.new(current_doctor) : UserAbility.new(current_user)
  end

  protected

  def configure_permitted_parameters
    new_params = [:phone_number, :first_name, :last_name, :date_of_birth, :admin]
    devise_parameter_sanitizer.permit(:sign_up, keys: new_params)
    devise_parameter_sanitizer.permit(:account_update, keys: new_params)
  end
end
