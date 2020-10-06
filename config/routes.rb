Rails.application.routes.draw do

  devise_for :students, controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }
  resource :students, only: [:show]


  devise_for :teachers, controllers: {
    sessions:      'teachers/sessions',
    passwords:     'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  resource :teachers, only: [:show]

  root to: "exams#index"
  resources :exams do
    # resources :transactions, only: [:index, :new, :create]
  end
end
