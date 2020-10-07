class ApplicationController < ActionController::Base
  binding.pry
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana]
    )
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(
  #     :sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana]
  #   )
  # end
end
