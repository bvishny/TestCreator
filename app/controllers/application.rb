# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '50e6a05817d5b596826414524bf167dd'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  private
  def auth
    unless session[:user_id]
      session[:intended_action] = request.request_uri
      flash[:notice] = "You must login to view this page"
      redirect_to :controller => :user, :action => :login
    else
      @user = User.find(session[:user_id])
      #Time.zone = @user.time_zone
      if @user.role == -1
        flash[:notice] = "( ! ) This account has been suspended."
        redirect_to :controller => :user, :action => :login
      end
    end
  end 
  
  def newpass(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    return Array.new(len){||chars[rand(chars.size)]}.join
  end
  
  def levenshtein(a, b)
   case
    when a.empty?: b.length
    when b.empty?: a.length
    else [(a[0] == b[0] ? 0 : 1) + levenshtein(a[1..-1], b[1..-1]),
          1 + levenshtein(a[1..-1], b),
          1 + levenshtein(a, b[1..-1])].min
    end
  end
  
  def pc_error(value, accepted)
    top = (accepted - value).abs
    (top.to_f / accepted.abs.to_f) * 100
  end
  
  def is_number?(value)
   begin
    int = Integer(value)
   rescue
    number = false
   else
    number = true
   end
   begin
    float = Float(value)
   rescue
    unless number
     number = false
    end
   else
     number = true
   end
   number
  end
end
