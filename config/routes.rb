Rails.application.routes.draw do
  root to: "exams#index"
  resources :exams do
    # resources :transactions, only: [:index, :new, :create]
  end

  resources :interviews, only: [:new, :create, :edit, :update]

  devise_for :students, controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }

  devise_scope :student do
    get 'students/search', to: 'students#search'
    get 'students/index', to: 'students#index'
    get 'students/:id', to: 'students/registrations#show'
    get 'students/:id/interviews', to: 'students/registrations#interviews'
    get 'student_profile_edit', to: 'students/registrations#student_profile_edit', as: 'student_profile_edit'
    patch 'student_profile_update', to: 'students/registrations#student_profile_update', as: 'student_profile_update'
  end

  # resources :students do
  #   collection do
  #     get :search
  #   end
  # end

  devise_for :teachers, controllers: {
    sessions:      'teachers/sessions',
    passwords:     'teachers/passwords',
    registrations: 'teachers/registrations'
  }

  devise_scope :teacher do
    get 'teachers/:id', to: 'teachers/registrations#show'
    get 'teachers/:id/student_details/:id', to: 'teachers/registrations#student_details'
    get 'teachers/:id/student_details/:id/interviews', to: 'teachers/registrations#interviews'
    get 'teachers/:id/teacher_profile_edit', to: 'teachers/registrations#teacher_profile_edit', as: 'teacher_profile_edit'
    patch 'teacher_profile_update', to: 'teachers/registrations#teacher_profile_update', as: 'teacher_profile_update'
  end


  namespace :api do
    resources :units, only: :index, defaults: { format: 'json' }
  end


end
