require 'rails_helper'

RSpec.describe Answer, type: :model do
	let(:teacher) {FactoryGirl.create(:teacher)}
  let(:student) {FactoryGirl.create(:student)}
  let(:homework) {FactoryGirl.create(:homework, user: teacher)}
	let(:assigned_homework) {FactoryGirl.create(:assigned_homework, homework: homework, user: student)}

	it "has a valid factory" do
		expect(assigned_homework.answers.create(:content => 'My Answer')).to be_valid
	end
	it "is invalid without a content" do
		expect(assigned_homework.answers.new(:content => nil)).to_not be_valid
	end
end
