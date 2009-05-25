class JsgenController < ApplicationController
  before_filter :auth
  before_filter :content_type
  def results
    @quiz = @user.quizzes.find_by_ref(params[:ref])
    @takens = @quiz.takens.find(:all, :conditions => ["status = 1 and quiz_id = ?", @quiz.id])
  end
  def editor
    @quiz = @user.quizes.find_by_ref(params[:ref])
    @items = @quiz.items.find(:all, :conditions => ["order_index ASC"])
  end
  private
  def content_type
    headers['Content-Type'] = 'text/javascript'
  end
end
