class Answer < ActiveRecord::Base
  belongs_to :homework
  belongs_to :user
  validates :content, presence: true
  validates :user, presence: true
  validates :homework, presence: true
end
