class User < ActiveRecord::Base
	has_many :homeworks
	has_many :assigned_homeworks
  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
end
