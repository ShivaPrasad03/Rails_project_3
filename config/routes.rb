Rails.application.routes.draw do
  resources :investors do 
    resources :portfolios
    end
    resources :portfolios
  
end
