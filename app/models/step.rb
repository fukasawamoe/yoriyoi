class Step < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :achievements

  validate :action_and_times_set_must_be_present_together

  def action_and_times_set_must_be_present_together
    if action.present? != times_set.present?
      errors.add(:base, "頑張ること・回数は両方入力してください")
    end
  end

  def create_achievements!
    (0..6).each do |n|
      achievements.create!(daily: Date.today - n)
    end
  end
end
