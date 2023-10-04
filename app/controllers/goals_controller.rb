class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to home_path(current_user.id)  # 目標の詳細ページへリダイレクト
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
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
  def set_goal
    @goal = Goal.find(params[:id])
  end
  def goal_params
    params.require(:goal).permit(:ideal_self) # 必要に応じてパラメータを調整します。
  end
end
