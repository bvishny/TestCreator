class UserController < ApplicationController
  before_filter :auth, :except => ["login", "register", "new", "preprocess"]
  def new
    if request.post?
      @user = User.new(params[:user])
      @user.ref = newpass(32)
      @user.ip = request.remote_ip
      @user.useragent = request.env['HTTP_USER_AGENT']
      @user.last_login = Time.now
      if @user.valid?
        @user.save!
        session[:user_id] = @user.id
        flash[:notice] = "Your account has been created successfully!"
      end
    end
  end
  def index
    render :action => :home
  end
  def search
    q = params[:q] ||= "WebQuiz"
    @quizzes = Quiz.find(:all, :conditions => ["name like ? and searchable = 1", '%' + q + '%'])
  end
  def login
    if request.post?
      username = params[:username] ||= ""
      password = params[:password] ||= ""
      @user = User.find(:first, :conditions => ["username = ?", username])
      if @user.blank? || @user.password != password
        flash[:notice] = "Invalid credentials provided. Please try again."
      else
        unless @user.role == -1
          @user.ip = request.remote_ip
          @user.last_login = Time.now
          @user.useragent = request.env['HTTP_USER_AGENT']
          @user.save!
          if @user.role == 5
            intended_action = session[:intended_action] ||= "/admin/environment"
          else
            intended_action = session[:intended_action] ||= "/user/home"
          end
          reset_session
          session[:user_id] = @user.id
          redirect_to intended_action 
        else
          flash[:notice] = "( ! ) This account has been suspended."
        end
      end
    end
  end
  
  def take_quizzes
    @qprogress = @user.takens.find(:all, :conditions => ["status = 2"], :order => ["updated_at DESC"])
    @completeds = @user.takens.find(:all, :conditions => ["status = 1"], :order => ["updated_at DESC"])
  end
  
  def quizzes
    @quizzes = @user.quizzes.find(:all, :order => ["updated_at DESC"])
  end
  
  def logout
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to :controller => :user, :action => :login
  end
  def preprocess
    @username = "tmp#{newpass(5).downcase}"
    @password = "pwd#{newpass(16)}"
  end
  def update
    if request.post?
      @user.password = params[:user][:password]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      @user.time_zone = params[:user][:time_zone]
      if @user.valid?
        @user.save!
        flash[:notice] = "Your account has been updated successfully!"
      end
    end
  end
end

