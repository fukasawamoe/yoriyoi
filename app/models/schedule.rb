class Schedule < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :schedule
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates_associated :tasks
  validates :name, presence: true,  length: { maximum: 255 }
end
