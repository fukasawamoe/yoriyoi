class StepsController < ApplicationController
  before_action :set_step, only: %i(create edit update destroy)

  def new
    @step = Step.new
    @goal = Goal.find_by(user_id: current_user.id)
  end

  def create
    @step = @goal.steps.build(step_params)
    if @step.save
      flash[:success] = '登録完了しましたにゃ！これから一緒にがんばるにゃ〜！'
      redirect_to home_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @step.update(step_params)
      if params[:home]
        flash[:success] = 'ステップを編集しました'
        redirect_to home_path
      elsif params[:goal]
        flash[:success] = 'ステップを編集しました'
        redirect_to edit_goal_path
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_step
    @goal = current_user.goal
    @step = Step.find_by(goal_id: @goal.id)
  end

  def step_params
    params.require(:step).permit(:action_1, :action_2, :action_3, :times_set_1, :times_set_2, :times_set_3)
  end
end
