class TasksController < ApplicationController
  # # READ - All tasks
  # get    'tasks',          to: 'tasks#index'

  # # CREATE
  # get    'tasks/new',      to: 'tasks#new'
  # post   'tasks',          to: 'tasks#create'

  # # NB: The `show` route needs to be *after* `new` route. - WHY??????
  # # READ - A single task
  # get    'tasks/:id',      to: 'tasks#show'

  # # UPDATE
  # get    'tasks/:id/edit', to: 'tasks#edit'
  # patch  'tasks/:id',      to: 'tasks#update'

  # # DELETE / DESTROY
  # delete 'tasks/:id',      to: 'tasks#destroy'

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params['id'].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    @task = params.require('task') # Import task object from Form submission
    @task = @task.permit(:title, :details) # The attributes must be permitted
    # before written to prevent malicious code.
    @new_task = Task.new(@task) # Now create the task
    @new_task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # @task = task_params_permit
    @task = Task.find(params['id'].to_i)
    @task.update(task_params_permit)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params['id'].to_i)
    @task.destroy
    redirect_to tasks_path
  end

  private

  # Refactored parameter permissions - purposefully not used for code execution
  # explanations under create method
  def task_params_permit
    params.require('task').permit(:title, :details, :completed)
  end
end
