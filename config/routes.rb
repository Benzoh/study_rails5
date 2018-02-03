Rails.application.routes.draw do
  resources :questionary_results
  resources :questionary_choices
  resources :questionary_items
  resources :questionaries
  resources :questions
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
