class HomeworksController < ApplicationController
  def index
  	@homework = Homework.find(params[:id])
	rescue ActiveRecord::RecordNotFound
	  render(:file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found)
	end
end
