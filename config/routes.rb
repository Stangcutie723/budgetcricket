BudgetCricket::Application.routes.draw do

  resources :budgets do
    resources :expenses
  end

  get "welcome/index"
  get "home/index"
  get "home/aboutbudget"
  get "home/contactus"
  get "home/aboutus"

  root to: "welcome#index"

  devise_for :users

  resources :questions do
    resources :answers
  end

end
