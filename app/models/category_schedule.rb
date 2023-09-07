class CategorySchedule < ApplicationRecord
  belongs_to :schedule
  belongs_to :category
end
