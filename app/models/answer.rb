class Answer < ActiveRecord::Base
  belongs_to :assigned_homework
  validates :content, presence: true
  validates :assigned_homework, presence: true
end
