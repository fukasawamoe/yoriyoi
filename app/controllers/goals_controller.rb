class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy ]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to home_path(current_user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      if params[:home]
        redirect_to home_path(current_user.id)
      elsif params[:step]
        redirect_to edit_step_path(current_user.id)
      end
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
    @step = Step.new(goal_id: @goal.id)
    Goal.transaction do
      @goal.save!
      @step = @goal.steps.create!
    end
    redirect_to home_path(current_user.id)
  rescue ActiveRecord::RecordInvalid
    render :new
  end


  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:ideal_self)
  end
end
