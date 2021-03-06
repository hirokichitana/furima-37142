class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :lastname_em, :firstname_em, :lastname_katakana, :firstname_katakana,
                                             :birth_date])
  end
end
