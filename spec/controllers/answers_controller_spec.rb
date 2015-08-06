require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
	let(:teacher) {FactoryGirl.create(:teacher)}
  let(:student) {FactoryGirl.create(:student)}
  let(:valid_student_session) {{user_id: student.id}}
  let(:homework) {FactoryGirl.create(:homework, :with_assigned_homework, user: teacher)}


  it "creates an answer and redirects to the root page" do
    post :create, {:answer => "My Answer", :user_id => student.id, :id => homework.id}, valid_student_session

    expect(response).to redirect_to(:root)

  end

end