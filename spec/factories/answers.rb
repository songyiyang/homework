FactoryGirl.define do
	factory :answer do
    sequence(:content){|n| "Answer #{n}"}
    assigned_homework
  end

end
