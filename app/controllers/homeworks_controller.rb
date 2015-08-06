class HomeworksController < ApplicationController
  def index
  	@homework = Homework.find(params[:id])
  	@answers = @homework.assigned_homeworks.joins(:answers).all.select('answers.id, assigned_homeworks.user_id, answers.created_at, answers.content').order(created_at: :desc)
	rescue ActiveRecord::RecordNotFound
		render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end

  def student_answers
  	@homework = Homework.find(params[:id])
  	@student = User.find(params[:user_id])
  	@answers = @homework.assigned_homeworks.where(:user => @student).joins(:answers).all.select('answers.id, answers.created_at, answers.content').order(created_at: :desc)
  rescue ActiveRecord::RecordNotFound
    render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end
end