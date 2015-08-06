Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  get 'homeworks/view/:id', to: 'homeworks#index', as: 'homeworks'
  get 'homeworks/view/:id/:user_id', to: 'homeworks#student_answers', as: 'homeworks_student_answers'
  get 'homeworks/answer/:id', to: 'homeworks#answer', as: 'homeworks_answer'
  post 'homeworks/answer/:id', to: 'answers#create', as: 'homeworks_answer_create'
end
