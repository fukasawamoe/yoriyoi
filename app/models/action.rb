class Action < ApplicationRecord
  belongs_to :goal
  has_one :achievements
end
