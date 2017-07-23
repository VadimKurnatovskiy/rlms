Rails.application.routes.draw do
  devise_for :teachers

  namespace :teachers do
    resource :dashboard, only: :show
    resources :courses
  end

  authenticated :teacher do
    root to: "teachers/dashboard#show", as: :teacher_root
  end

  get "pages/welcome"

  root to: "pages#welcome"
end
