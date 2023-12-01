class Goal < ApplicationRecord
  belongs_to :user
  has_many :steps
  accepts_nested_attributes_for :steps
end
