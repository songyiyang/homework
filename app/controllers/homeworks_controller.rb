class HomeworksController < ApplicationController
  def index
  	@homework = Homework.find(params[:id])
  end
end
