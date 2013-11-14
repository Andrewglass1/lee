Lee::Application.routes.draw do
  root 'info#index'

  resources :projects, :only => [:index, :new, :create]
  get "projects/:slug" => "projects#show"

  resources :info, :only => [:index]
  resources :teaching, :only => [:index]
  resources :shop, :only => [:index]
end
