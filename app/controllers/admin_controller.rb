class AdminController < ApplicationController
  before_filter :admin_auth
  def users
    @users = User.find(:all)
  end
  private
  def admin_auth
    unless session[:user_id]
      session[:intended_action] = request.request_uri
      flash[:notice] = "You must have administrative access to view this page."
      redirect_to :controller => :user, :action => :login
    else
      @user = User.find(session[:user_id])
      if @user.role != 5
        session[:intended_action] = request.request_uri
        flash[:notice] = "You must have administrative access to view this page."
        redirect_to :controller => :user, :action => :login
      end
    end 
  end
end
