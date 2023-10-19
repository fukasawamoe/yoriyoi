class StepsController < ApplicationController
  before_action :set_step, only: %i[show edit update destroy ]

  def new
    @step = Step.new
    @goal = Goal.find_by(user_id: current_user.id)
  end

  def create
    binding.pry
    @step = Step.new(step_params)
    @step.goal_id = current_user.goals.id
    if @step.save
      redirect_to home_path(current_user.id)  # 目標の詳細ページへリダイレクト
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @step.update(step_params)
      if params[:home]
        redirect_to home_path(current_user.id)
      elsif params[:goal]
        redirect_to edit_goal_path(current_user.id)
      end
    else
      render :edit, status: :unprocessable_entity
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
