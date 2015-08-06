require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:teacher) {FactoryGirl.create(:teacher)}
  let(:student) {FactoryGirl.create(:student)}
  let(:valid_teacher_session) {{user_id: teacher.id}}
  let(:valid_student_session) {{user_id: student.id}}

  describe "GET #index" do
    it "redirects to login page if user is not logged in" do
      get :index
      expect(response).to redirect_to login_url
    end

    it "returns http success if user is logged in as teacher" do
      get :index, {}, valid_teacher_session
      expect(response).to have_http_status(:success)
    end

    it "returns http success if user is logged in as student" do
      get :index, {}, valid_student_session
      expect(response).to have_http_status(:success)
    end

    it "returns teacher template if sign in as teacher" do
      get :index, {}, valid_teacher_session
      expect(response).to render_template(:teacher)
    end

    it "returns student template if sign in as student" do
      get :index, {}, valid_student_session
      expect(response).to render_template(:student)
    end
  end

end
