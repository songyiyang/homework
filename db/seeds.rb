FactoryGirl.create(:teacher, username: 'teacher')

FactoryGirl.create(:student, username: 'student')

5.times do
	FactoryGirl.create(:homework, user: User.where(:role => 0).sample)
end

20.times do
	user = User.where(:role => 1).sample
	homework = Homework.all.sample
	FactoryGirl.create(:answer, user: user, homework: homework)
end