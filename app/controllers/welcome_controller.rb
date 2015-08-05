class WelcomeController < ApplicationController
  def index
  	if current_user.role == 'teacher'
  		render :teacher
  	elsif current_user.role == 'student'
  		render :student
  	end
  end
end
