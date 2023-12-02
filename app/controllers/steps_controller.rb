class StepsController < ApplicationController
  before_action :set_step, only: %i(create edit update destroy)

  def new
    @step = Step.new
    @goal = Goal.find_by(user_id: current_user.id)
  end

  def create
    @goal = Goal.find_by(user_id: current_user.id)
    @steps = params[:step][:steps].values.map do |step_params|
      step_params.merge!({user_id: current_user.id})
      @goal.steps.new(step_params)
    end
    if @steps.all?(&:valid?)
      @steps.each(&:save!)
      flash[:success] = '登録完了しましたにゃ！これから一緒にがんばるにゃ〜！'
      redirect_to home_path
    else
      render :new
    end
  end

  def edit; end

  def update
    binding.pry
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

  def achievement
    # Goalのview
    @goal = Goal.find_by(user_id: current_user.id)
    # Stepのview
    @step = Step.find_by(goal_id: @goal.id)
    # Achievementのview
    @achievement = achievement.find_by(step_id: @step.id)
  end
  private

  def set_step
    @goal = current_user.goal
    @steps = Step.where(user_id: current_user.id)
  end

  def step_params
    params.require(:step).permit(:action, :times_set)
  end
end
