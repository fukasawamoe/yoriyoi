class Category < ApplicationRecord
  belongs_to :user
  has_many :category_schedules
  has_many :schedules, through: :category_schedules
  accepts_nested_attributes_for :category_schedules, allow_destroy: true
end
