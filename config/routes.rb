Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'

  post '/users' => 'users#create'

  get 'messages' => 'messages#index'
  post '/messages' => 'messages#create'

  root 'users#index'
end
