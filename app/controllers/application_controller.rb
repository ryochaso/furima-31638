class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_app_login


  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :kana_family, :kana_first, :birthday])
    end

    def basic_app_login
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_APP_LOGIN_USER"] && password == ENV["BASIC_APP_LOGIN_PASSWORD"]
      end
    end
end
