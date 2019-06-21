Rails.application.routes.draw do
  resources :employee_messages
  resources :mails
  resources :employee_tasks
  resources :tasks
  resources :projects
  resources :managers
  resources :employees
  resources :login, only: [:new, :create]

  root 'application#hello'
  post "/message_redirect", to: "common_pages#message_redirect", as: "message_redirect"
  get "/logout", to: "login#destroy", as: "logout"
  get "/show/:username", to: "common_pages#show", as: "common_show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
