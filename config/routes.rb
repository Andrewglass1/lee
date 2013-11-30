Lee::Application.routes.draw do
  root 'info#index'

  resources :projects, :only => [:index, :new, :create, :update]
  get "projects/:slug" => "projects#show"
  get "projects/:slug/edit" => "projects#edit", as: 'edit_project'
  get "manage-projects" => "projects#manage", as: 'manage_projects'

  resources :info, :only => [:index]
  resources :teaching, :only => [:index]
  resources :shop, :only => [:index]

  resources :admin, :only => [:index]

end
