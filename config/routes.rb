Rails.application.routes.draw do

  # コントローラーでの実装上以下がないと404エラーになる
  # パラメータを受け取るためのルーティングと言ってもよい？
  get 'questionary_items/new/:id', to: 'questionary_items#new'

  resources :questionary_results
  resources :questionary_choices
  resources :questionary_items
  resources :questionaries
  resources :questions
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
