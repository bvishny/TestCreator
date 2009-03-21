class JsgenController < ApplicationController
  before_filter :auth
  def results
    @quiz = @user.quizzes.find_by_ref(params[:ref])
    @takens = @quiz.takens.find(:all, :conditions => ["status = 1 and quiz_id = ?", @quiz.id])
    headers['Content-Type'] = 'text/javascript'
  end
end
