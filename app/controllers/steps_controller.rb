class StepsController < ApplicationController
  before_action :require_login
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
        step.create_achievements!
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

  def day_check
    @step = Step.find_by(id: params[:id], user_id: current_user.id)
    @achievements = @step.achievements
    @achievement = @achievements.find(params[:id])
    if @achievement.check == false
      @achievement.update(check: true)
    else
      @achievement.update(check: false)
      respond_to do |format|
        @achievement.save!

        format.html { redirect_to home_index_path }
        format.turbo_stream
      end
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
