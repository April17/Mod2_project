Rails.application.routes.draw do
  resources :mails
  resources :employee_tasks
  resources :tasks
  resources :projects
  resources :managers
  resources :employees
  resources :login, only: [:new, :create]

  get "/show/:username", to: "common_pages#show", as: "common_show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
