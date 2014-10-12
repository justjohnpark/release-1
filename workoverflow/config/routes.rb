Workoverflow::Application.routes.draw do
  root 'projects#index'
  resources :projects, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  resource :admins, only: [] do
    resources :projects do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  get "/login",                       to: "users#login_form",                 as: "login_form"
  post "/login",                      to: "users#login",                      as: "login"
  get "/logout",                      to: "users#logout",                     as: "logout"

  resources :users, only: [:new, :create, :show]

  post "/comments/:id/votes/new",     to: "votes#comment_create",            as: "comment_vote"
  post "/projects/:id/votes/new",     to: "votes#project_create",            as: "project_vote"

  get "/sort",                        to: "projects#sort",                   as: "sort"
  get "/sort/popularity",             to: "projects#popularity_sort",        as: "popularity_sort"
end
