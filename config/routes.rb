Rails.application.routes.draw do
  resources :employee_tasks
  resources :tasks
  resources :projects
  resources :managers
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
