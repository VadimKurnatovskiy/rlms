Rails.application.routes.draw do
  devise_for :teachers
  get "pages/welcome"

  root to: "pages#welcome"
end
