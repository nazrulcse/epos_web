Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees, controllers: {
                           sessions: 'employees/sessions',
                           passwords: 'employees/passwords',
                           registrations: 'employees/registrations',
                           unlocks: 'employees/unlocks',
                           confirmations: 'employees/confirmations',
                           invitations: 'employees/invitations'
                       }

  as :employee do
    get 'login', to: 'devise/sessions#new', as: :user_login
    delete 'logout', to: 'devise/sessions#destroy', as: :user_logout
    get 'registration', to: 'devise/registrations#new', as: :company_registration
  end


  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/activities/:type', to: 'activities#changes'
      delete '/activities/remove', to: 'activities#remove'
      post '/activities/offline_changes', to: 'activities#offline_changes'
      resources :employees, only: [:index, :show]
      resources :departments, only: [:index]
      namespace :pos do
        resources :suppliers, only: [:index]
        resources :customers, only: [:index]
        resources :products
      end
    end
  end


  post '/submit_contact', to: 'home#submit_contact', as: :submit_contact

  get '/terms-and-conditions', to: 'home#terms_and_conditions'
  get '/pricing', to: 'home#pricing'
  get '/take-a-tour', to: 'home#take_a_tour'
  get '/contact-us', to: 'home#contact_us', as: :contact_us
  get 'modules/employee', to: 'home#employee'
  get 'modules/attendance', to: 'home#attendance'
  get 'modules/bank', to: 'home#bank'

  # For employee resources
  resources :employees do
    get :attendances
    get :settings
    post :import, on: :collection
    get :profile
    get :download_templete, on: :collection
    post :add, on: :collection
    put :update_info, on: :member
    get :access_rights, on: :collection
    patch :update_password, on: :collection
    put :activation, on: :member
    get :payroll_categories, on: :member
    get :increments, on: :member
    get :identity_attachment, on: :member
    get :card
  end

  get '/confirm_email', to: 'employees#confimed_email_error'
  resources :access_rights


  resources :departments do
    get :switch, on: :member
    get :all_settings, on: :member
    member do
      scope :settings do
        get :employee
        get :leave
        get :budget
        get :general
        get :attendance
        get :designation
      end
    end
  end

  resources :settings do
    get :confirm, on: :collection
    get :features, on: :collection
    get :billing, on: :collection
    post :payment_method, on: :collection
    post :company_feature, on: :collection
  end

  namespace :attendance do
    get :dashboard
    resources :attendances do
      get :history, on: :collection
      get :report, on: :collection
      get :employee_wise_report, on: :collection
      get :in, on: :collection
      get :out, on: :member
      get :stats, on: :collection
    end
    resources :day_offs do
      post :generate, on: :collection
    end
  end

  resources :designations, except: [:index]

  resources :companies do
    get :profile, on: :collection
    get :employee, on: :collection
    get :departments, on: :collection
  end

  namespace :bank do
    resources :accounts
  end

  namespace :pos do

    namespace :customers do
      resources :categories
      resources :invoices do
        collection do
          get :close_invoice
        end
        member do
          get :history
        end
      end
      resources :invoice_items
      resources :payments
    end
    resources :customers do
      collection do
        post :process_invoice
      end
      member do
        get :history
        get :print_voucher
      end
    end

    namespace :suppliers do
      resources :purchases do
        member do
          get :receive
        end
        collection do
          get :history
        end
      end
      resources :purchase_items
      resources :payments
    end
    resources :suppliers

    namespace :products do
      resources :brands
      resources :models
      resources :categories do
        member do
          get :sub_categories
        end
      end
      resources :queue_codes do
        collection do
          get :print_barcode
        end
      end
      resources :sub_categories
    end
    resources :products

    resources :stocks do
      collection do
        get :history
      end
    end
  end

  resources :changed_settings, only: [:new, :create, :edit, :update, :destroy]

  # You can have the root of your site routed with "root"
  root 'home#index'

  %w( 404 422 500 503 ).each do |code|
    get code, :to => 'errors#show', :code => code
  end

  get '/*other', :to => 'errors#show', :code => 404
end
