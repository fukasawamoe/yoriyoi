module HomeHelper
  # 現在の曜日のスケジュールを取得するメソッド
  def current_day_schedules(user)
    # 現在の曜日を取得（0:日曜日, 1:月曜日, ..., 6:土曜日）
    current_day_of_week = Time.current.wday
    # ユーザーが作成したスケジュールを取得
    # day_of_weekは配列。例えばユーザーが平日や休日として同じスケジュールを設定できるようにするため
    user.schedules.includes(:tasks).where('day_of_week @> ARRAY[?]::integer[]', current_day_of_week)
  end

  # 次の曜日のスケジュールを取得するメソッド
  def next_day_schedules(user)
    next_day_of_week = (Time.current.wday + 1) % 7
    user.schedules.includes(:tasks).where('day_of_week @> ARRAY[?]::integer[]', next_day_of_week)
  end

  # 現在のタスクと次のタスクを取得するメソッド
  def current_and_next_tasks(schedules)
    # 現在の時間を取得
    current_time = Time.current.strftime("%H:%M")
    tasks = schedules.map(&:tasks).flatten.sort_by(&:task_time)
    current_task = tasks.select { |task| task.task_time.strftime("%H:%M") <= current_time }.last
    next_task = tasks.select { |task| task.task_time.strftime("%H:%M") > current_time }.first
    [current_task, next_task]
  end
end
