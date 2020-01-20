class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    added_attrs = [ :nickname,
                    :familyname,
                    :firstname,
                    :phonenumber,
                    :firstname_kana,
                    :familyname_kana,
                    :birthyear,
                    :birthmonth,
                    :birthday,
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
  end
end
