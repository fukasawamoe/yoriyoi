class Schedule < ApplicationRecord
  # スケジュールのidをハッシュ化
  include Hashid::Rails
  belongs_to :user
  # スケジュールが削除されたときに関連するタスクも一緒に削除
  has_many :tasks, inverse_of: :schedule, dependent: :destroy
  # 同フォーム内で複数モデルを取り扱う スケジュールを作成または更新する際に、関連するタスクも一緒に作成または更新
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: {message: "スケジュール名を入力してください"},  length: { maximum: 255 }
  validates :day_of_week, presence: {message: "曜日を選択してください"}
  # ユーザーが同じ曜日に複数のスケジュールを作成できないようにする
  validate :unique_day_of_week_per_user

  private

  def unique_day_of_week_per_user
    # 現在のユーザーが持っているスケジュールの曜日を取得（編集しているスケジュールは除く）
    existing_days = user.schedules.where.not(id: id).pluck(:day_of_week).flatten
    # 新しく作成または更新しようとしているスケジュールの曜日
    new_days = day_of_week
    # 既存のスケジュールと新しいスケジュールで重複する曜日があるか確認
    if (existing_days & new_days).any?
      errors.add(:base, '各曜日につき一つだけスケジュールを作成できます')
    end
  end
end
