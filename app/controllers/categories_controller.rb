class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
  #   schedule_time = Time.parse(time_str)
  # binding.pry
    # スケジュールを保存
    @category = Category.new(category_params)
    @category.schedule_time = schedule_time
  binding.pry
    if @category.save
      # スケジュールの保存が成功した場合の処理
      redirect_to @category, notice: 'スケジュールが作成されました。'
    else
      # スケジュールの保存が失敗した場合の処理
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name,
        category_schedules_attributes: [:id, :schedule_id, :schedule_time, :task, :memo, :goal_select, :_destroy])
  end
end
