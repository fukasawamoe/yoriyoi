class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule, through: :category_schedule
  has_many :category_schedule
end
