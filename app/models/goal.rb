class Goal < ApplicationRecord
  belongs_to :user
  has_one :step
end
