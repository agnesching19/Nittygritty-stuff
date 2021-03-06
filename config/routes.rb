Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :staffs do
    resources :votes, only: [:new, :create, :show]
  end
  resources :voted_staffs, except: :update
  get '/votes', to: 'votes#index'
  get '/admin', to: 'pages#admin'
  delete '/admin/votes', to:'pages#destroy', as: :admin_votes
  get '/admin/stop_vote', to: 'pages#stop_vote'

  root to: "pages#home"
end
