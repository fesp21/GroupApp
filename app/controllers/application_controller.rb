# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user_session, :current_user, :conferences
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def conferences
    @conferences = ["hf390otgveponuho", "268j1spb3t3f4z4f", "6etbl814r6cu6j3h", "s0zu45ryx2advocd", "f3292vc61t5unzzt", "hn7vxnq0yjbh3cws", "9bchssjv681aptiy", "5fwpv8f0lec4zc3a", "f7r64xrsdzyzkoz5", "f7r64xrsdzyzkoz5"]
    return @conferences
  end
end
