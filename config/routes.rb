Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'registrations', sessions: 'sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show create update] do
    member do
      get :result
      post :gist
    end
  end

  resources :contacts, only: %i[new create]

  resources :achievements, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index

    resources :badges, except: :show
  end
end
