class GoalsController < ApplicationController
  before_action :require_login
  before_action :set_goal, only: %i(edit update)

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to new_step_path #初回のみ/steps/new
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @goal.update(goal_params)
      if params[:home]
        flash[:notice] = '目標を編集しました'
        redirect_to home_index_path
      elsif params[:step]
        flash[:notice] = '目標を編集しました'
        redirect_to edit_steps_path
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def skip
    Goal.transaction do
      goal = Goal.new(user_id: current_user.id)
      goal.save!

      3.times do
        step = Step.new(user_id: current_user.id, goal_id: @goal.id)
        step.save!
        step.create_achievements!
      end
    end
    flash[:notice] = 'まずはスケジュールを作成してみてにゃ'
    redirect_to home_index_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def set_goal
    @goal = current_user.goal
  end

  def goal_params
    params.require(:goal).permit(:ideal_self)
  end
end
