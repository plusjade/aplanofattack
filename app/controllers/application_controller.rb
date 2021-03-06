# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
    
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1e2074d45c182ed5f3743d8d17ccd9c7'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def updating_sample_account
      if current_user.email == 'sample@sample.com'
        render :json => 
        {
          'status' => 'bad',
          'msg'    => "Cannot delete sample account data."
        }
        return true      
      end    
    end
        
    def is_sample_account
      if current_user.email == 'sample@sample.com'
        render :json => 
        {
          'status' => 'bad',
          'msg'    => "Cannot delete sample account data."
        }
        return true      
      end    
    end

    # checking for quickstart slideshow in sample account.
    def is_quickstart_guide(resource)
      if resource.id == 8
        render :json => 
        {
          'status' => 'bad',
          'msg'    => "The Quickstart Guide is Readonly. Please create new pages and slideshows."
        }
        return true      
      end    
    end
        
end
