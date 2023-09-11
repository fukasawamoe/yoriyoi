class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Form::Category.new

  end

  def create
  #   schedule_time = Time.parse(time_str)
  # binding.pry
    # スケジュールを保存
    @category = Form::Category.new(category_params)

  binding.pry
    if @category.save
      # スケジュールの保存が成功した場合の処理
      redirect_to category_path, notice: 'スケジュールが作成されました。'
    else
      # スケジュールの保存が失敗した場合の処理
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:form_category).permit(
                                    Form::Category::REGISTRABLE_ATTRIBUTES +
                                    [category_schedules_attributes: Form::CategorySchedule::REGISTRABLE_ATTRIBUTES])
  end
end
