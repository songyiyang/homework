class AnswersController < ApplicationController
	def create
		assigned_homework = AssignedHomework.find_by(:homework_id => params[:id], :user_id => current_user.id)
		if assigned_homework.homework.due_date > Time.now
			assigned_homework.answers.create(:content => answer_params[:answer])
			flash[:notice] = "Answer successfully submitted!"
		else
			flash[:alert] = "Due time has passed, answer can not be submitted!"
		end
		redirect_to :root
	end

	private
		def answer_params
	    params.permit(:answer)
		end
end