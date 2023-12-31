namespace :create_achevements_data do
  desc '毎日、0時にachievementの当日の日付データを作成する' # desc で処理の説明文を記入する
  task create_achievement_daily_data: :environment do # taskの名前を付ける。 environmentはDBへアクセスする場合に追記する。今回だとstateカラムの中身が変わるので必要。
    User.find_each do |user|
      user.steps.each do |step|
        unless step.achievements.exists?(daily: Date.current)
          step.achievements.create!(daily: Date.current)
        end
      end
    end
  end
end
