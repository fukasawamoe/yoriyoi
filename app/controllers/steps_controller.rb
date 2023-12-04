class StepsController < ApplicationController
  before_action :set_step, only: %i(create edit update destroy)

  def new
    @step = Step.new
    @goal = Goal.find_by(user_id: current_user.id)
  end

  def create
    @steps = params[:step][:steps].values.map do |step_params|
      step_params.merge!({user_id: current_user.id})
      @goal.steps.new(step_params)
    end
    if @steps.all?(&:valid?)
      @steps.each do |step|
        step.save!
        step.create_achievement
      end
      flash[:success] = '登録完了しましたにゃ！これから一緒にがんばるにゃ〜！'
      redirect_to home_index_path
    else
      render :new
    end
  end

  def edit_multiple
    @goal = current_user.goal
    @steps = current_user.steps
  end

  def update_multiple
    @goal = current_user.goal
    @steps = Step.update(params[:steps].keys, params[:steps].values)

    if @steps.all? { |step| step.errors.empty? }

      if params[:home]
        flash[:success] = 'ステップを編集しました'
        redirect_to home_index_path
      elsif params[:goal]
        flash[:success] = 'ステップを編集しました'
        redirect_to edit_goal_path
      end
    else
      render :edit_multiple, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def add_day_check
    step = Step.find_by(id: params[:id], user_id: current_user.id)
    if step && step.achievement
      target_day = params[:day] # この値はリクエストのパラメータから取得
      step.achievement.day_check[target_day.to_i] = !step.achievement.day_check[target_day.to_i]
      step.achievement.save!
      redirect_to home_index_path
    end
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
