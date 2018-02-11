Rails.application.routes.draw do

  get 'ajax/index'
  get 'ajax/data'

  get 'schedules', to: 'schedules#new'
  get 'schedules/schedule_new/:id', to: 'schedules#schedule_new'
  get 'schedules/edit/:id', to: 'schedules#edit'
  resources :roles
  resources :users
  resources :divisions
  resources :manager_schedules
  resources :manger_schedules
  resources :editor_schedules
  resources :designer_schedules
  # resources :schedules
  resources :schedules do
    # :user_idはパラメータ名になる
    get 'bulk_edit/(:user_id)', to: 'schedules#bulk_edit'
    get 'edit/(:user_id)', to: 'schedules#edit'
  end

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
