class HomesController < ApplicationController

  def index
    # 現在の曜日を取得（0:日曜日, 1:月曜日, ..., 6:土曜日）
    current_day_of_week = Time.current.wday
    # ログインユーザーが作成したスケジュールを取得
    @schedules = current_user.schedules.includes(:tasks).where('day_of_week @> ARRAY[?]::integer[]', current_day_of_week)

    # 現在の時間を取得
    current_time = Time.current.strftime("%H:%M")

    # 現在の時間に基づいて次のタスクを取得

    @next_task = @schedules.map(&:tasks).flatten.select { |task| task.task_time.strftime("%H:%M") >= current_time }.min_by(&:task_time)

    respond_to do |format|
      format.html
      format.js { render partial: 'next_task', locals: { task: @next_task } }
    end
  end


  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
