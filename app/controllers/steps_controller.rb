class StepsController < ApplicationController
  before_action :set_step, only: %i[show edit update destroy ]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.user_id = current_user.id
    if @step.save
      redirect_to home_path(current_user.id)  # 目標の詳細ページへリダイレクト
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @step.update(step_params)
      redirect_to home_path(current_user.id)
    else
      render :edit
    end
  end

  def show
  end

  def delete
  end

  private
  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:action_1, :action_2, :action_3, :times_set_1, :times_set_2, :times_set_3) # 必要に応じてパラメータを調整します。
  end
end
