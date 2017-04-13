Rails.application.routes.draw do
root 'welcome#index', as: 'welcome'
  resources :works
  resources :users
  resources :votes
end
