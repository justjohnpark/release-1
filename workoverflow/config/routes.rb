Workoverflow::Application.routes.draw do
  root 'projects#index'
  resources :projects, only: [:index, :show, :new, :edit, :create, :update]

  resource :admins, only: [] do
    resources :projects do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  # get "/comments/new(.:format)",      to: "comments#new",                   as: "new_comment"
  # get "/comments(.:format)",          to: "comments#create"
  # get "/comments/:id(.:format)",      to: "comments#destroy"

  get "/login",                       to: "users#login_form",                 as: "login_form"
  post "/login",                      to: "users#login",                      as: "login"
  get "/logout",                      to: "users#logout",                     as: "logout"

  resources :users, only: [:new, :create, :show]

  post "/comments/:id/votes/new",     to: "votes#comment_create",            as: "comment_vote"
  post "/projects/:id/votes/new",     to: "votes#project_create",            as: "project_vote"

  get "/sort/popularity",             to: "projects#popularity_sort",        as: "popularity_sort"
  get "/sort/category",               to: "projects#category_sort",          as: "category_sort"
  get "/sort/location",               to: "projects#location_sort",          as: "location_sort"
  get "/sort/remote",                 to: "projects#remote_sort",            as: "remote_sort"
  get "/sort/recent",                 to: "projects#recent_sort",            as: "recent_sort"
end


#remember show_door
