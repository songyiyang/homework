teacher_counts = 3
studnet_counts = 10
homework_counts = 20
answer_counts = 100

teacher_counts.times do
	FactoryGirl.create(:teacher)
end

studnet_counts.times do
	FactoryGirl.create(:student)
end

homework_counts.times do
	FactoryGirl.create(:homework, :with_assigned_homework, user: User.where(:role => 0).sample)
end

answer_counts.times do
	assigned_homework = AssignedHomework.all.sample
	from = assigned_homework.homework.created_at
	to = assigned_homework.homework.due_date
	FactoryGirl.create(:answer, created_at: Time.at(rand * (to - from).to_f + from.to_f), assigned_homework: assigned_homework)
end