Rails.application.routes.draw do
  get 'bill_imports/new'

  get 'bills/index'

  resources :bill_imports

  resources :bills do
  	collection do
  		post :import
  	end
  end

  root to: 'bills#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
