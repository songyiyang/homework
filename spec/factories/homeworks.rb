FactoryGirl.define do
	factory :homework do
    sequence(:subject){|n| "Homework Subject #{n}"}
    sequence(:content){|n| "Homework Content #{n}"}
    due_date { rand(1..7).day.from_now }
    user
  end

end
