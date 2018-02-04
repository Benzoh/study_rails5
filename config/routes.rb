Rails.application.routes.draw do

  resources :roles
  resources :users
  resources :divisions
  get 'schedules', to: 'schedules#new'
  resources :manager_schedules
  resources :manger_schedules
  resources :editor_schedules
  resources :designer_schedules
  resources :schedules

  # コントローラーでの実装上以下がないと404エラーになる
  # パラメータを受け取るためのルーティングと言ってもよい？
  get 'questionary_items/new/:id', to: 'questionary_items#new'
  get 'questionary_choices/new/:id', to: 'questionary_choices#new'
  get 'questionary_results/calc/:id', to: 'questionary_results#calc'
  post 'questionaries/:id', to: 'questionaries#sendform'

  resources :questionary_results
  resources :questionary_choices
  resources :questionary_items
  resources :questionaries
  resources :questions
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
