class Schedule < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :schedule, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true,  length: { maximum: 255 }
  validates :day_of_week, presence: true
  validate :unique_day_of_week_per_user

  private

  def unique_day_of_week_per_user
    # ユーザーが作成したすべてのスケジュールの曜日を取得
    existing_days = user.schedules.where.not(id: id).pluck(:day_of_week).flatten
    # 新しく作成または更新しようとしているスケジュールの曜日
    new_days = day_of_week
    # 既存のスケジュールと新しいスケジュールで重複する曜日があるか確認
    if (existing_days & new_days).any?
      errors.add(:base, '各曜日につき一つだけスケジュールを作成できます')
    end
  end
end
