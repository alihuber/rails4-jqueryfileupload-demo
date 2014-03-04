Uploader::Application.routes.draw do
  root "tasks#index"
  resources "tasks"
end
