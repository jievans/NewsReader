NewReader::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, :only => [:create, :destroy, :new]
  resources :feeds, only: [:index, :create, :show] do
    resources :entries, only: [:index]
  end

  root to: "feeds#index"
end
