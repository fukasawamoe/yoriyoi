class HomesController < ApplicationController

  def index
    # 現在の曜日を取得（0:日曜日, 1:月曜日, ..., 6:土曜日）
    current_day_of_week = Time.current.wday
    # ログインユーザーが作成したスケジュールを取得
    @schedules = current_user.schedules.where('day_of_week @> ARRAY[?]::integer[]', current_day_of_week)
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
