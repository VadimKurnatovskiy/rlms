Rails.application.routes.draw do
  devise_for :teachers

  namespace :teachers do
    resource :dashboard, only: :show
    resources :courses do
      resources :topics, shallow: true, only: %i[create edit update destroy]
    end
  end

  authenticated :teacher do
    root to: "teachers/dashboard#show", as: :teacher_root
  end

  get "pages/welcome"

  root to: "pages#welcome"
end
