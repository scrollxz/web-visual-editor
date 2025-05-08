Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :websites, path: '' do
    resources :elements, controller: 'website_content/elements'
  end

  resources :elements, only: :update
end
