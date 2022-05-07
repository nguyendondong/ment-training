class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
   
    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :set_locale
    before_action :authenticate_user!
    def set_locale
      locale = params[:locale].to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ?
        locale : I18n.default_locale
    end
    
    def default_url_options
      {locale: I18n.locale}
    end
    def after_sign_in_path_for(resource)

      if resource.role.name == "admin"
        return admin_path 
      else
        return root_path
      end
    end

  

   
    protected
   
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys:[:date,:name,:email,:role_id,:avatar,:remove_avatar,addresses_attributes:[:id,:address1,:address2,:city,:company,:email,:firstname,:lastname,:phone,:sex,:zipcode]])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:date,:name,:email,:role_id,addresses_attributes:[:address1,:address2,:city,:company,:email,:firstname,:lastname,:phone,:sex,:zipcode]])
    end
  end
  