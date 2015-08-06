require 'rails_helper'

RSpec.describe User, type: :model do
	it "has a valid factory" do
		expect(FactoryGirl.create(:teacher)).to be_valid
	end
	it "is invalid without a username" do
		expect(FactoryGirl.build(:teacher, username: nil)).to_not be_valid
	end
	it "is invalid without a role" do
		expect(FactoryGirl.build(:teacher, role: nil)).to_not be_valid
	end

	it "returns a user's role as a string for teacher" do
		teacher = FactoryGirl.create(:teacher)
		expect(teacher.role).to eq 'teacher'
	end

	it "returns a user's role as a string for student" do
		teacher = FactoryGirl.create(:student)
		expect(teacher.role).to eq 'student'
	end

	it "does not allowed duplicate usernames" do
		FactoryGirl.create(:teacher, :username => 'teacher')
		expect(FactoryGirl.build(:teacher, :username => 'teacher')).to_not be_valid
	end
end
