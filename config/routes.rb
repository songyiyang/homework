Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  get 'homeworks/view/:id', to: 'homeworks#teacher_view', as: 'homeworks'
  get 'homeworks/view/:id/:user_id', to: 'homeworks#teacher_view_student_answers', as: 'homeworks_student_answers'
  get 'homeworks/:id/answer', to: 'homeworks#answer', as: 'homeworks_answer'
  post 'homeworks/:id/answer', to: 'answers#create', as: 'homeworks_answer_create'
end
