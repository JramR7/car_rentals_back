Rails.application.routes.draw do
    resources :users
    resources :contracts
    resources :companies
    resources :modified_documents
    resources :trips
    resources :cars
    resources :rental_users
    resources :owners


    get '/count_users', to: 'users#count_users'
end
