Rails.application.routes.draw do
  devise_for :learners
  devise_for :teachers

  namespace :api do
    namespace :v1 do
      resources :topics, only: :update
    end
  end

  namespace :teachers do
    resource :dashboard, only: :show

    resources :materials, only: %i(create destroy)

    resources :courses do
      resources :topics, shallow: true, except: :index do
        resources :questions, shallow: true, only: %i(create update destroy)
        resources :materials, shallow: true, only: %i(create destroy)
      end
    end
  end

  namespace :learners do
    resource :dashboard, only: :show

    resources :available_courses, only: :index
    resources :course_participations, only: %i(create destroy)
    resources :courses, only: %i(index show)
    resources :topics, only: :show
  end

  authenticated :teacher do
    root to: "teachers/dashboard#show", as: :teacher_root
  end

  authenticated :learner do
    root to: "learners/dashboard#show", as: :learner_root
  end

  get "pages/welcome"

  root to: "pages#welcome"
end
