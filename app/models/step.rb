class Step < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :achievements, dependent: :destroy

  # 0より大きい整数を確認
  validates :times_set, numericality: { only_integer: true, greater_than: 0 }

  # actionとtimes_setは両方データが入っているか確認
  validate :custom_action_presence
  validate :custom_times_set_presence

  #step作成と同時にachivementモデルも作成する
  def create_achievements!
    6.downto(0) do |n|
      achievements.create!(daily: Date.today - n)
    end
  end

  private

  def custom_action_presence
    if times_set.present? && action.blank?
      errors.add(:base, "頑張ることを入力してください")
    end
  end

  def custom_times_set_presence
    if action.present? && times_set.blank?
      errors.add(:base, "回数を入力してください")
    end
  end

  # バリデーションメッセージにメッセージにカラム名を非表示
  def self.human_attribute_name(attr, options = {})
    ""
  end
end
