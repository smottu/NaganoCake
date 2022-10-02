class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
   case resource
    when Admin
     admin_path
    when Customer
     customers_mypage_path
   end
  end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Admin
  #    admin_session_path
  #   when Customer
  #    root_path
  #  end
  # end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :telephone_number])
  end

end
