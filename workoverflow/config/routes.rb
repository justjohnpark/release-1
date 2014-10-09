Workoverflow::Application.routes.draw do
  root 'projects#index'
  resources :projects, only: [:index, :show]

  resource :admins do
    resources :projects do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  # get "/comments/new(.:format)",      to: "comments#new",                   as: "new_comment"
  # get "/comments(.:format)",          to: "comments#create"
  # get "/comments/:id(.:format)",      to: "comments#destroy"

  get "/login",                       to: "admins#login_form",               as: "login_form" #rename this later, may run into a path error
  post "/login",                      to: "admins#login",                    as: "login" #rename this later, may run into a path error
  get "/logout",                      to: "admins#logout",                   as: "logout"

  post "/comments/:id/votes/new",     to: "votes#comment_create",            as: "comment_vote"
  post "/projects/:id/votes/new",     to: "votes#project_create",            as: "project_vote"
end


#remember show_door
