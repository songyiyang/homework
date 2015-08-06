require 'rails_helper'

RSpec.describe HomeworksController, type: :controller do
  let(:teacher) {FactoryGirl.create(:teacher)}
  let(:student) {FactoryGirl.create(:student)}
  let(:homework) {FactoryGirl.create(:homework, user: teacher)}
  let(:valid_teacher_session) {{user_id: teacher.id}}
  let(:valid_student_session) {{user_id: student.id}}

  describe "GET #teacher_view" do
    it "returns not found status if not found homework" do
      get :teacher_view, {:id => -1}, valid_teacher_session
      expect(response).to have_http_status(:not_found)
    end
    it "returns http success status if homework exists" do
      get :teacher_view, {:id => homework.id}, valid_teacher_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #teacher_view_student_answers" do
    it "returns not found status if not found homework" do
      get :teacher_view_student_answers, {:id => -1, :user_id => student.id}, valid_teacher_session
      expect(response).to have_http_status(:not_found)
    end
    it "returns not found status if not found user" do
      get :teacher_view_student_answers, {:id => homework.id, :user_id => -1}, valid_teacher_session
      expect(response).to have_http_status(:not_found)
    end
    it "returns http success status if homework and user exists" do
      get :teacher_view_student_answers, {:id => homework.id, :user_id => student.id}, valid_teacher_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #answer" do
    it "returns not found status if not found homework" do
      get :answer, {:id => -1}, valid_student_session
      expect(response).to have_http_status(:not_found)
    end
    it "returns http success status if homework exists" do
      get :answer, {:id => homework.id}, valid_student_session
      expect(response).to have_http_status(:success)
    end
  end
end