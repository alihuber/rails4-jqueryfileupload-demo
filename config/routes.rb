Uploader::Application.routes.draw do
  root "tasks#index"
  resources :tasks
  resources :attachments, :only => [:create, :destroy]
  patch "attachments", to: "attachments#create"
end
