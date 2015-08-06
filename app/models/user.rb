class User < ActiveRecord::Base
	has_many :homeworks
	has_many :assigned_homeworks
	has_many :answers
  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
end
