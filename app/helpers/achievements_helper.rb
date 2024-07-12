module AchievementsHelper
  def achievement_period
    "#{Date.today - 6.days}から#{Date.today}まで"
  end

  def calculate_achievement_percentage(step)
    true_count = step.achievements.where(daily: Date.today - 6.days..Date.today, check: true).count
    total_count = step.achievements.where(daily: Date.today - 6.days..Date.today).count
    total_count > 0 ? (true_count.to_f / total_count * 100).round : 0
  end
end
