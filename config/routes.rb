Rails.application.routes.draw do
<<<<<<< HEAD
  resources :students
=======
>>>>>>> bdf24fd32b7588ceb6b25425264885add358f35e
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
<<<<<<< HEAD
   root "students#index"
=======
  # root "posts#index"
>>>>>>> bdf24fd32b7588ceb6b25425264885add358f35e
end
