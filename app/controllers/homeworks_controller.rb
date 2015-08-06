class HomeworksController < ApplicationController
  def teacher_view
  	@homework = Homework.find(params[:id])
  	@answers = @homework.assigned_homeworks.joins(:answers).all.select('answers.id, assigned_homeworks.user_id, answers.created_at, answers.content').group(:user_id).having("answers.created_at = MAX(answers.created_at)").order("answers.created_at DESC")
	rescue ActiveRecord::RecordNotFound
		render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end

  def teacher_view_student_answers
  	@homework = Homework.find(params[:id])
  	@student = User.find(params[:user_id])
  	@answers = @homework.assigned_homeworks.where(:user => @student).joins(:answers).all.select('answers.id, answers.created_at, answers.content').order("answers.created_at DESC")
  rescue ActiveRecord::RecordNotFound
    render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end

  def answer
    @homework = Homework.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end

end