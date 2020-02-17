class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:last_name,:j_family_name,:j_last_name,:birthday_year,:birthday_month,:birthday_day,address_attributes:[:ship_family_name,:ship_last_name,:ship_j_family_name,:postal_code,:prefectures,:municipalities,:house_number,:building,:phone_number]])
    # devise_parameter_sanitizer.permit(:sign_up) { |u|
    #   u.permit(:address_attributes => [:ship_family_name,:ship_last_name,:ship_j_family_name,:postal_code,:prefectures,:municipalities,:house_number,:building,:phone_number]) 
    # }
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
    
  end
end
