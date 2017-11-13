Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entrenadors do
  	resources :usuarios do
  		resources :rutinas do
  			resources :ejercicios
  		end
  	end
  end
end
