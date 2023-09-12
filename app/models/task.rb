class task < ApplicationRecord
  belongs_to :Schedule

  validates :task_time, presence: true
  validates :task, presence: true
  validates :memo, presence: true

  validate :custom_validation_for_task_time

  enum goal_select: { off: 0, on: 1 }


  def custom_validation_for_task_time
    if task.present? && task_time.blank?
      errors.add(:task_time, "時間を指定してください。")
    elsif task.blank? && task_time.present?
      errors.add(:task, "タスクを入力してください。")
    end
  end
end
