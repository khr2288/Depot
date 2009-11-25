# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'

  before_filter :authorize, :except => :login
  before_filter :set_locale

  layout "store"

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        session[:original_uri] = request.request_uri # keeps track of requested page to be displayed after authentication
        flash[:notice] = "Please log in"
        redirect_to :controller => 'admin' , :action => 'login'
      end
    end

    def set_locale

      #check and set locale in session
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale] || I18n.default_locale

      #check and load locale file
      locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
      unless I18n.load_path.include? locale_path
        I18n.load_path << locale_path
        I18n.backend.send(:init_translations)
      end
    rescue Exception => err
      logger.error err
      flash.now[:notice] = "#{I18n.locale} translation not available"
      
      I18n.load_path -= [locale_path]
      I18n.locale = session[:locale] = I18n.default_locale
    end

  # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
