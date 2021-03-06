Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/todaytasks', to: "dashboard#today_tasks"

  resources :medical_records
  resources :symptoms
  resources :medical_professionals do
    resources :appointments, only: [:new, :create]
    resources :prescriptions, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create]
  resources :prescriptions, except: [:new, :create]
  get '/adddose', to: "prescriptions#add_dose"
  resources :calendar, only: [:index, :show]
  resources :wellbeings, only: [:index, :show]
  resources :photos, only: [:destroy]
  resources :profile, only: [:show, :edit, :update]
  resources :treatments, only: [:show, :update, :destroy]
end
