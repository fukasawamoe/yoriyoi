class StepsController < ApplicationController
  before_action :require_login
  before_action :set_step, only: %i(create edit update)

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
      @steps.each do |step|
        step.save!
        step.create_achievements!
      end
      flash[:notice] = '登録完了しましたにゃ！これから一緒にがんばるにゃ〜！'
      redirect_to home_index_path
    else
      @step = @steps.find { |step| step.errors.any? }
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @goal = current_user.goal
    @steps = current_user.steps
  end

  def update
    @goal = current_user.goal
    @steps = Step.update(params[:steps].keys, params[:steps].values)

    if @steps.all? { |step| step.errors.empty? }
      flash[:notice] = 'ステップを編集しました'
      if params[:home]
        redirect_to home_index_path
      elsif params[:goal]
        redirect_to edit_goal_path
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def day_check
    @user = current_user
    @steps = current_user.steps.all
    @step = Step.find_by(id: params[:id], user_id: current_user.id)
    @achievement = @step.achievements.find(params[:achievement_id])
    if @achievement.check == false
      @achievement.update(check: true)
    else
      @achievement.update(check: false)
    end
    @achievement.save!
    respond_to do |format|
      @achievement.save!

      format.html { redirect_to home_index_path }
      format.turbo_stream
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
