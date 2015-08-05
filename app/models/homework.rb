class Homework < ActiveRecord::Base
	validates :subject, presence: true, uniqueness: true
  validates :content, presence: true
  validates :due_date, presence: true
end
