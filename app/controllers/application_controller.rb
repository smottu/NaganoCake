class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
   case resource
    when Admin
     root_path
    when User
     root_path
   end
  end

  def top
  end

end
