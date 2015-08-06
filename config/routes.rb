Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  get 'homeworks/:id', to: 'homeworks#index', as: 'homeworks'
  get 'homeworks/:id/:user_id', to: 'homeworks#student_answers', as: 'homeworks_student_answers'
end
