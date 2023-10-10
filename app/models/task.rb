class Task < ApplicationRecord
  belongs_to :schedule
  acts_as_list scope: :schedule

  validates :task_time, presence: true
  validates :to_do, presence: true

end
