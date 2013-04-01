Iet::Application.routes.draw do


  devise_for :users
  
  root :to => "pages#index"
  namespace :admin do
    root :to => "dashboard#index"

    resources :expenses
    resources :incomes
end
end
