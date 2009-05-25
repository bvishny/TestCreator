class JsgenController < ApplicationController
  before_filter :auth
  before_filter :set_headers
  def results
    @quiz = @user.quizzes.find_by_ref(params[:ref])
    @takens = @quiz.takens.find(:all, :conditions => ["status = 1 and quiz_id = ?", @quiz.id])
  end
  def editor
    @quiz = @user.quizes.find_by_ref(params[:ref])
    @items = @quiz.items.find(:all, :conditions => ["order_index ASC"])
  end
  private
  def set_headers
    headers['Content-Type'] = 'text/javascript'
    headers['Cache-Control'] = 'no-cache'
  end
end
