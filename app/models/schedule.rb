class Schedule < ApplicationRecord
  has_many :category_schedules
  has_many :categories, through: :category_schedules

  validates :schedule_time, presence: true
  validates :task, presence: true
  validates :memo, presence: true

  validate :custom_validation_for_schedule_time

  enum goal_select: { off: 0, on: 1 }


  def custom_validation_for_schedule_time
    if schedule.present? && schedule_time.blank?
      errors.add(:schedule_time, "時間を指定してください。")
    elsif schedule.blank? && schedule_time.present?
      errors.add(:task, "タスクを入力してください。")
    end
  end
end
