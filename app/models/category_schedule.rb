class CategorySchedule < ApplicationRecord
  belongs_to :category
  belongs_to :schedule
end
