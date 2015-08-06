class AnswersController < ApplicationController
	def create
		assigned_homework = AssignedHomework.find_by(:homework_id => params[:id], :user_id => current_user.id)
		assigned_homework.answers.create(:content => answer_params[:answer])
		redirect_to :root
	end

	private
		def answer_params
	    params.permit(:answer)
		end
end