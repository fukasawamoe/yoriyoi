namespace :schedule_notifications do
  desc "時間ごとにスケジュール通知を行う"
  task ai_message_schedule_notifications: :environment do
    User.find_each do |user|
      user.schedules.each do |schedule|
        schedule.tasks.each do |task|
          if task.task_time == Time.current
            # ここでユーザーに通知を送ります
            # 実際の通知方法は、使用している通知システムによります
          end
        end
      end
    end
  end
end
