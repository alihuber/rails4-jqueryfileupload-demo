Uploader::Application.routes.draw do
  root "tasks#index"
  resources :tasks
  resources :attachments, :only => [:index, :create, :destroy]
end
