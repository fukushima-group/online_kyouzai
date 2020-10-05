Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  root to: "items#index"
  resources :exams do
    # resources :transactions, only: [:index, :new, :create]
  end
end
