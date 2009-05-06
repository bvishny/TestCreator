class QuizController < ApplicationController
  before_filter :auth, :except => ["take"]
  def take 
    if not session[:user_id]
      flash[:notice] = "Please register in order to take this quiz. We promise it's quick."
      session[:intended_action] = request.request_uri
      redirect_to :controller => :user, :action => :register
    else
      @quiz = Quiz.find_by_ref(params[:id])
      @user = User.find(session[:user_id])
      takens = @user.takens.find(:all, :conditions => ["quiz_id = ? and (status = 1 or status = 4)", @quiz.id])
      current_attempt = @user.takens.find(:first, :conditions => ["quiz_id = ? and status = 2", @quiz.id])
      if @quiz.attempts == 0
        attempts = 9999999999999
      else
        attempts = @quiz.attempts
      end
      if @quiz.password_protect == 2
        redirect_to :action => :process_page, :id => "unavailable", :ref => @quiz.ref
      elsif not current_attempt.blank? 
        redirect_to :action => :resume, :id => current_attempt.ref
      elsif takens.size >= attempts and @quiz.password_protect != 2
        redirect_to :action => :process_page, :id => "attempts", :ref => @quiz.ref
      elsif @quiz.password_protect == 1 and not session["authorize_quiz_#{@quiz.ref}"]
        redirect_to :action => :process_page, :id => "password", :ref => @quiz.ref
      else
        @taken = Taken.new
        @taken.user = @user
        @taken.ref = newpass(32)
        @taken.status = 2
        @taken.score = 0
        @taken.quiz = @quiz
        @taken.save!
        @items = @quiz.items.find(:all, :order => ["order_index ASC"])
      end
    end
  end
  def cfca
    @quiz = Quiz.find_by_ref(params[:id])
    current_attempt = @user.takens.find(:first, :conditions => ["quiz_id = ? and status = 2", @quiz.id])
    if not current_attempt.blank?
      render :text => "<script type='text/javascript'>document.location.href='/quiz/process_page/current_review'</script>"
    else
      render :text => "<!-- ok  -->"
    end
  end
  def review_inspector
    taken_ref = params[:id].split("!")[1]
    question_ref = params[:id].split("!")[0]
    @taken = @user.takens.find(:first, :conditions => ["ref = ? and status = 1", taken_ref])
    current_attempt = @user.takens.find(:first, :conditions => ["quiz_id = ? and status = 2", @taken.quiz.id])
    if current_attempt.blank?
      @question = @taken.quiz.items.find(:first, :conditions => ["ref = ?", question_ref])
       if is_number? @question.answer and @question.type2 == 5
        @number = true
       end
    else
      render :text => "<h1>Action not allowed</h1>"
    end
  end
  def submit
    @quiz = Quiz.find(:first, :conditions => ["ref = ?", params[:quiz_ref]])
    if @quiz.password_protect == 2
      error = true
      render :text => "Action not allowed"
    end
    if @quiz.blank?
      taken = @user.takens.find(:first, :order => ["updated_at DESC"])
      @quiz = taken.quiz
      error = true
    end
    @taken = @user.takens.find(:first, :conditions => ["status = 2 and quiz_id = ?", @quiz.id])
    @takens = @user.takens.find(:all, :conditions => ["quiz_id = ? and (status = 1 or status = 4)", @quiz.id])
    if not @taken.blank?
      @ok = true
    else
      redirect_to :controller => :user, :action => :take_quizzes
    end
    unless error
      for i in @quiz.items
        response = @taken.answers.find(:first, :conditions => ["item_id = ?", i.id])
        if not response.blank?
          if response.correct == 1
            item = Item.find(response.item_id)
            @taken.score += item.points
          end
        end
      end
      @taken.status = 1
      @taken.save!
    end
     @takens = @user.takens.find(:all, :conditions => ["quiz_id = ? and (status = 1 or status = 4)", @quiz.id])
  end
  def review
    @taken = @user.takens.find_by_ref(params[:id])
    @quiz = @taken.quiz
    @takens = @user.takens.find(:all, :conditions => ["quiz_id = ? and (status = 1 or status = 4)", @quiz.id])
    current_attempt = @user.takens.find(:first, :conditions => ["quiz_id = ? and status = 2", @quiz.id])
    if not current_attempt.blank? 
     redirect_to :action => :process_page, :id => "current_review"
    end
    @items = @quiz.items.find(:all, :order => ["order_index ASC"])
  end
  def change_score
    @taken = Taken.find(:first, :conditions => ["status = 1 and ref = ?", params[:id]])
    if @taken.quiz.user.id == @user.id
      @taken.score = params[:value].to_f
      @taken.save!
      render :text => @taken.score
    else
      render :text => "Access Denied"
    end
  end
  def review_mod
    @taken = Taken.find(:first, :conditions => ["status = 1 and ref = ?", params[:id]])
    if @taken.quiz.user.id == @user.id
      @quiz = @taken.quiz
      @items = @quiz.items.find(:all, :order => ["order_index ASC"])
    else
      flash[:notice] = "Access has been denied to the resource you requested"
      redirect_to :controller => :user, :action => :home
    end
  end
  def check_answer
    @quiz = Quiz.find(:first, :conditions => ["ref = ? and (password_protect = 0  or password_protect = 1)", params[:quiz_ref]])
    @taken = @user.takens.find(:first, :conditions => ["quiz_id = ? and status = 2", @quiz.id])
    @item = @quiz.items.find_by_ref(params[:ref])
    answer_test = @taken.answers.find(:first, :conditions => ["item_id = ?", @item.id])
    if answer_test.blank?
      @answer = Answer.new
      @answer.item_id = @item.id
      @answer.ref = newpass(32)
      @answer.taken = @taken
      @answer.answer = params[:answer]
    else
      @answer = answer_test
      @answer.answer = params[:answer]
    end
    if @item.type2 == 4
      user_answer = params[:answer]
      if @item.answer == user_answer
        @answer.correct = 1
      else
        @answer.correct = 0
      end
      @answer.save!
    elsif @item.type2 == 5
      if @item.c2 != ""
        if is_number? @item.answer
          if pc_error(params[:answer].to_f, @item.answer.to_f) <= @item.c2.to_f
            @answer.correct = 1
            @answer.save!
          else
            @answer.correct = 0
            @answer.save!
          end 
        else
         user_answer = params[:answer].capitalize
         if levenshtein(user_answer, @item.answer.capitalize) <= @item.c2.to_i
          @answer.correct = 1
          @answer.save!
         else
          @answer.correct = 0
          @answer.save!
         end
        end
      else
        user_answer = params[:answer]
        if @item.answer == user_answer
          @answer.correct = 1
        else
          @answer.correct = 0
        end
        @answer.save!
      end
    end
    render :text => "[Response Received]"
  end
  def resume
    @taken = @user.takens.find(:first, :conditions => ["ref = ? and status = 2", params[:id]])
    if @taken.blank?
      redirect_to :action => :take, :id => params[:id]
    else
      @quiz = @taken.quiz
      @items = @quiz.items.find(:all, :order => ["order_index ASC"])
    end
  end
  def process_page
    if params[:ref]
      @quiz = Quiz.find_by_ref(params[:ref])
    end
    if params[:id] == "password"
      render :action => :password
    elsif params[:id] == "attempts"
      render :action => :attempts
    elsif params[:id] == "current_review"
      render :action => :review_conflict
    elsif params[:id] == "unavailable"
     render :action => :unavailable
    end
  end
  def do_action
    if params[:id] == "password"
      @quiz = Quiz.find_by_ref(params[:ref])
      if params[:password] == @quiz.password
        session["authorize_quiz_#{@quiz.ref}"] = true
        redirect_to :action => :take, :id => @quiz.ref
      else
        redirect_to :action => :process_page, :id => :password, :ref => @quiz.ref
        flash[:notice] = "<strong>Password incorrect. Please try again or check with your instructor.</strong>"
      end
    end
  end
  def end_quiz
    @quiz = @user.takens.find(:first, :conditions => ["ref = ? and status = 2", params[:id]])
    unless @quiz.blank?
      @quiz.destroy
    end
  end
  def create
    if request.post?
      @quiz = Quiz.new(params[:quiz])
      @quiz.user = @user
      @quiz.searchable = 1
      @quiz.theme_id = 1
      @quiz.ref = newpass(32)
      @quiz.scale = 1
      @quiz.save!
      redirect_to :action => :edit, :id => @quiz.ref
    end
  end
  def assign_answer
    @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item.answer = params[:answer]
    @item.save!
    render :text => "Success!"
  end
  def inspect
    @item = Item.find(params[:id].delete("item_").to_i)
    if @item.quiz.user.id == session[:user_id]
      if is_number? @item.answer and @item.type2 == 5
        @number = true
      end
    else
      render :text => "You do not have permission to inspect this item!"
    end
  end
  def delete
    @quiz = @user.quizzes.find_by_ref(params[:id])
    @quiz.ref = newpass(32)
    @quiz.user_id = 0
    @quiz.searchable = 0
    @quiz.attempts = 1
    @quiz.password_protect = 2
    @quiz.save!
    flash[:notice] = "Quiz deleted successfully."
    redirect_to :controller => :user, :action => :home
  end
  def delete_taken
    @quiz = @user.takens.find_by_ref(params[:id])
    @quiz.status = 4
    @quiz.save!
    flash[:notice] = "Quiz removed from your profile. Please note that if this quiz does not allow multiple attempts, you will not be able to take it again."
    redirect_to :controller => :user, :action => :home
  end
  def delete_item
    @item = Item.find_by_ref(params[:id])
    if @item.quiz.user.id == session[:user_id]
       id = @item.id
       @item.destroy
       render :text => "<script type='text/javascript'>new Effect.DropOut('item_#{id}');$('inspected').update('<em>No item selected</em>');</script>"
    else
      render :text => "You do not have permission to delete this item!"
    end
  end
  def item
    @item = Item.find(params[:id])
    if @item.quiz.user.id == session[:user_id]
      render :action => :add_item
    else
      render :text => "You do not have permission to view this item!"
    end
  end
  def reorder
    @quiz = @user.quizzes.find_by_ref(params[:id])
    data = params[:data].delete("itemcanvas[]=").split("&")
    for i in 0..(data.size - 1)
      item = @quiz.items.find(data[i].to_i)
      item.order_index = i 
      item.save!
    end
    render :text => "SUCCESS!"
  end
  def edit_choice
    @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item["c" + params[:number]] = params[:value]
    @item.save!
    render :text => @item["c" + params[:number]].to_s
  end
  def edit_explanation
    @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item.explanation = params[:value]
    @item.save!
    render :text => @item.explanation
  end
  def edit_points
    @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item.points = params[:value].to_f
    @item.save!
    render :text => @item.points
  end
  def edit_width_and_height
    @item = Item.find(params[:id])
    if @item.quiz.user.id == session[:user_id]
      @item.c1 = params[:width]
      @item.c2 = params[:height]
      @item.save!
    end
    render :text => "Success!"
  end
  def edit_url
     @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item.url = params[:value]
    @item.save!
    flash[:url_change] = true
    render :text => @item.url
  end
  def edit_text
    @item = @user.quizzes.find_by_ref(params[:quiz_ref]).items.find_by_ref(params[:id])
    @item.text = params[:value]
    @item.save!
    render :text => @item.text
  end
  def add_item
    @quiz = @user.quizzes.find_by_ref(params[:id])
    @part = Part.find_by_ref(params[:ref])
    @item = Item.new
    @item.quiz = @quiz 
    @item.type2 = @part.type2
    @item.url = @part.url ||= ""
    @item.text = @part.text ||= ""
    @item.points = @part.points ||= 0.0
    @item.c1 = @part.c1 ||= ""
    @item.c2 = @part.c2 ||= ""
    @item.c3 = @part.c3 ||= ""
    @item.c4 = @part.c4 ||= ""
    @item.c5 = @part.c5 ||= ""
    @item.answer = @part.answer ||= ""
    @item.explanation = @part.explanation ||= ""
    @item.context = @part.context ||= ""
    @item.pc_error = @part.pc_error ||= 0.0
    @item.capitalize = @part.capitalize ||= 1
    @item.levenshtein = @part.levenshtein ||= 1
    order = @quiz.items.maximum('order_index').to_i
    @item.order_index = order + 1
    @item.ref = newpass(32)
    @item.save!
  end
  def results
    attr = ["updated_at", "score"]
    order = ["ASC", "DESC"]
    i = params[:attr].to_i ||= 0
    j = params[:order].to_i ||= 0
    @quiz = @user.quizzes.find_by_ref(params[:id])
    @results = @quiz.takens.find(:all, :conditions => ["status = 1"], :order => ["#{attr[i]} #{order[j]}"])
  end
  def edit_settings
    @quiz = @user.quizzes.find_by_ref(params[:id])
  end
  def update
    if request.post?
      @quiz = @user.quizzes.find_by_ref(params[:id])
      @quiz.password_protect = params[:quiz][:password_protect]
      @quiz.total = params[:quiz][:total]
      @quiz.password = params[:quiz][:password]
      @quiz.attempts = params[:quiz][:attempts]
      @quiz.searchable = params[:search]
      @quiz.save!
      flash[:notice] = "Quiz updated successfully."
      redirect_to :controller => :user, :action => :home
    end
  end
  def edit
    @quiz = @user.quizzes.find_by_ref(params[:id])
    @items = @quiz.items.find(:all, :order => ["order_index ASC"])
  end
  def image_proxy
  	item = Item.find_by_ref(params[:id])
  	taken = @user.takens.find(:first, :conditions => ["quiz_id = ?", item.quiz.id])
  	if ! taken.blank?
  	 #require 'net/http'
     # url = URI.parse(item.c4)
     # req = Net::HTTP::Get.new(url.path)
     # res = Net::HTTP.start(url.host, url.port) {|http|
     # 	http.request(req)
      # }
    #	send_data res.body, :disposition => 'inline'
    end
  	render :text => item.inspect
  end
end