class TasksController < ApplicationController
  def new
    @form = Form::TaskCollection.new
    #@task = task.new
  end

  def create
    @form = Form::taskCollection.new(task_collection_params)
    binding.pry
    if @form.save
      redirect_to task_path
    else
      render :new
    end
    # #task_time = Time.parse(time_str)
    # # スケジュールを保存
    # @task = task.new(task_params)
    # @task.task_time = task_time
    # # if @task.save
    # #   # スケジュールの保存が成功した場合の処理
    # #   redirect_to @task, notice: 'スケジュールが作成されました。'
    # # else
    # #   # スケジュールの保存が失敗した場合の処理
    # #   render :new, status: :unprocessable_entity
    # # end
  end

  private
  def task_collection_params
    params.require(:form_task_collection)
    .permit(tasks_attributes: [:task_time, :task, :memo, :goal_select])
  end
end
