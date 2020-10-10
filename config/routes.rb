Rails.application.routes.draw do

  devise_for :students, controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }

  devise_scope :student do
    get 'students/:id', to: 'students/registrations#show'
    get 'student_profile_edit', to: 'students/registrations#student_profile_edit', as: 'student_profile_edit'
    patch 'student_profile_update', to: 'students/registrations#student_profile_update', as: 'student_profile_update'
  end

  # resource :students, only: [:show]


  devise_for :teachers, controllers: {
    sessions:      'teachers/sessions',
    passwords:     'teachers/passwords',
    registrations: 'teachers/registrations'
  }

  devise_scope :teacher do
    get 'teachers/:id', to: 'teachers/registrations#show'
    get 'teachers/:id/teacher_profile_edit', to: 'teachers/registrations#teacher_profile_edit', as: 'teacher_profile_edit'
    patch 'teacher_profile_update', to: 'teachers/registrations#teacher_profile_update', as: 'teacher_profile_update'
  end

  # resource :teachers, only: [:show]

  root to: "exams#index"
  resources :exams do
    # resources :transactions, only: [:index, :new, :create]
  end
end
