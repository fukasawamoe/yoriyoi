class Task < ApplicationRecord
  belongs_to :schedule

  validates :task_time, presence: true
  validates :to_do, presence: true
  validates :memo, presence: true

end
