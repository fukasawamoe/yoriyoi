module AchievementsHelper
  def achievement_period
    "#{Date.today - 6.days}から#{Date.today}まで"
  end

  def calculate_achievement_percentage(step, times_set)
    true_count = step.achievements.where(daily: Date.today - 6.days..Date.today, check: true).count
    times_set > 0 ? (true_count.to_f / times_set * 100).round : 0
  end
end
