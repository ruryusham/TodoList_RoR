Rails.application.routes.draw do

  post '/lists/search' => 'lists#result'
  get '/lists/search' => 'lists#search'
  
  post '/lists/:list_id/tasks/:id/toggle', to: 'tasks#toggle', as: 'task_toggle'  
  resources :lists do
    resources :tasks, only: [:create, :destroy]
  end
  
  post '/lists/:list_id/tasks/:id/toggle' => 'tasks#toggle'  

  root 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
