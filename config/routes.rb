BudgetCricket::Application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  get "welcome/index"
  get "home/index"
  get "aboutbudget/index"
  get "contactus/index"
  get "aboutus/index"

  root to: "welcome#index"

end


  #root "welcome#index"
