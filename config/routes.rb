Rails.application.routes.draw do
	
  devise_for :users
  root to:'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books do
 	resource :book_comments,only:[:create,:destroy]
 	resource :favorites, only: [:create, :destroy]
 end
 resources :users
 resources :homes
 get 'home/about'=>'home#about'
end
