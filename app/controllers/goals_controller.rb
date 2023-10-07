class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy ]

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

  def skip
    @goal = Goal.new(user_id: current_user.id)
    @step = Step.new(goal_id: current_user.goal.id) # ここで新しいActionを作成します

    Goal.transaction do
      @goal.save!
      @step = @goal.steps.create! # ここで新しいStepを作成します
    end

    redirect_to home_path(current_user.id) # 保存が成功した後にリダイレクトするパス
  rescue ActiveRecord::RecordInvalid
    render :new# 保存が失敗した場合の処理
  end


  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:ideal_self)
  end
end
