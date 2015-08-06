require 'rails_helper'

RSpec.describe Homework, type: :model do
	let(:teacher) {FactoryGirl.create(:teacher)}
	let(:homework) {FactoryGirl.create(:homework, user: teacher)}
	it "has a valid factory" do
		expect(homework).to be_valid
	end
	it "is invalid without a subject" do
		expect(FactoryGirl.build(:homework, user: teacher, subject: nil)).to_not be_valid
	end
	it "is invalid without a content" do
		expect(FactoryGirl.build(:homework, user: teacher, content: nil)).to_not be_valid
	end
	it "is invalid without a due_date" do
		expect(FactoryGirl.build(:homework, user: teacher, due_date: nil)).to_not be_valid
	end
end
