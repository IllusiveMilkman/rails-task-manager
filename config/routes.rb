Rails.application.routes.draw do
  # READ - All tasks
  get    'tasks',          to: 'tasks#index'

  # CREATE
  get    'tasks/new',      to: 'tasks#new'
  post   'tasks',          to: 'tasks#create'

  # NB: The `show` route needs to be *after* `new` route. - WHY??????
  # READ - A single task
  get    'tasks/:id',      to: 'tasks#show', as: :task

  # UPDATE
  get    'tasks/:id/edit', to: 'tasks#edit', as: :task_edit
  patch  'tasks/:id',      to: 'tasks#update'

  # DELETE / DESTROY
  delete 'tasks/:id',      to: 'tasks#destroy'
end
