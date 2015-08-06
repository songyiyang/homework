class Homework < ActiveRecord::Base
	belongs_to :user
	has_many :assigned_homeworks
	validates :subject, presence: true, uniqueness: true
  validates :content, presence: true
  validates :due_date, presence: true
  validates :user, presence: true
end
