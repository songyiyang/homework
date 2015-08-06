class WelcomeController < ApplicationController
  def index
  	if current_user.role == 'teacher'
  		@homeworks = Homework.where(:user => current_user).order(:due_date)
  		render :teacher
  	elsif current_user.role == 'student'
  		@assigned_homeworks = AssignedHomework.where(:user => current_user)
  		render :student
  	end
  end
end
