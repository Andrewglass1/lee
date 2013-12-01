Lee::Application.routes.draw do
  root 'info#index'

  resources :projects, :only => [:index, :new, :create, :update, :destroy]
  get "projects/:slug" => "projects#show"
  get "projects/:slug/edit" => "projects#edit", as: 'edit_project'
  get "manage-projects" => "projects#manage", as: 'manage_projects'

  resources :info, :only => [:index]
  resources :teaching, :only => [:index]
  get 'edit-teaching', to: 'teaching#edit', as: "edit_teaching"
  put 'update-teaching', to: 'teaching#update', as: "update_teaching"

  resources :shop, :only => [:index]

  resources :admin, :only => [:index]

end
