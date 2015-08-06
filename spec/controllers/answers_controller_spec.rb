require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
	let(:teacher) {FactoryGirl.create(:teacher)}
  let(:student) {FactoryGirl.create(:student)}
  let(:homework) {FactoryGirl.create(:homework, user: teacher)}
  let(:assigned_homework) {FactoryGirl.create(:assigned_homework, homework: homework, user: student)}
  let(:valid_student_session) {{user_id: student.id}}

  it "creates an answer and redirects to the root page" do
  	assigned = assigned_homework

    post :create, {:answer => "My Answer", :user_id => assigned.user.id, :id => assigned.homework.id}, valid_student_session

    expect(response).to redirect_to(:root)

  end

end