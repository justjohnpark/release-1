Workoverflow::Application.routes.draw do
  root 'project#index'
  resources :projects, only: [:index, :show]

  resource :admin do
    resources :projects do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  # get "/comments/new(.:format)",      to: "comments#new",                   as: "new_comment"
  # get "/comments(.:format)",          to: "comments#create"
  # get "/comments/:id(.:format)",      to: "comments#destroy"

  get "/login",                       to: "admin#login_form",               as: "login_form" #rename this later, may run into a path error
  post "/login",                      to: "admin#login",                    as: "login" #rename this later, may run into a path error
  get "/logout",                      to: "admin#logout",                   as: "logout"

end


#remember show_door
