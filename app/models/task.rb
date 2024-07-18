class Task < ApplicationRecord
  belongs_to :schedule

  validates :task_time, presence: {message: "タスクを行う時間を入力してください"}
  validates :to_do, presence: {message: "タスクを入力してください"}
  # validate :task_time_presense

  private

  def task_time_presense
    if task_time.blank? || task_time.hour.blank? || task_time.min.blank?
      errors.add(:task_time, 'タスクを行う時間を入力してください')
    end
  end
end
