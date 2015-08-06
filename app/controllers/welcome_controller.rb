class WelcomeController < ApplicationController
  def index
  	if current_user.role == 'teacher'
  		@homeworks = Homework.where(:user => current_user)
  		render :teacher
  	elsif current_user.role == 'student'
  		render :student
  	end
  end
end
