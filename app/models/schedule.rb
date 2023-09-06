class Schedule < ApplicationRecord
  has_many :schedule, through: :category_schedule
  has_many :category_schedule

  validate :custom_validation_for_schedule_time

  enum goal_select: { not_selected: 0, selected: 1 }

  def custom_validation_for_schedule_time
    if schedule.present? && schedule_time.blank?
      errors.add(:schedule_time, "時間を指定してください。")
    elsif schedule.blank? && schedule_time.present?
      errors.add(:task, "タスクを入力してください。")
    end
  end
end
