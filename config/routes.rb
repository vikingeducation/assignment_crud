Rails.application.routes.draw do
  root "posts#index"

  resources :posts, :only =>[:new, :create, :index, :show, :edit, :update, :destroy]
end
