class AssignedHomework < ActiveRecord::Base
  belongs_to :user
  belongs_to :homework
  has_many :answers
end
