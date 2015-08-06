class HomeworksController < ApplicationController
  def index
  	@homework = Homework.find(params[:id])
  	@answers = @homework.answers.order(created_at: :desc).group(:user_id)
	rescue ActiveRecord::RecordNotFound
		render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
  end
end
