FactoryGirl.define do
	factory :answer do
    sequence(:content){|n| "Answer Content #{n}"}
    user
    homework
  end

end
