FactoryGirl.define do
	factory :homework do
    sequence(:subject){|n| "Homework #{n}"}
    sequence(:content){|n| "Question #{n}"}
    due_date { rand(1..8).day.from_now }
    user
    trait :with_assigned_homework do
	    after(:create) do |homework|
	    	students = User.where(:role => 1)
	    	assigned_counts = rand(0..students.count)
	    	students.sample(assigned_counts).each do |user|
	    		create(:assigned_homework, homework: homework, user: user)
	    	end
	    end
	  end
  end

end
