BudgetCricket::Application.routes.draw do

  resources :budgets do
    resources :expenses
  end

  get "welcome/index"
  get "home/index"
  get "aboutbudget/index"
  get "contactus/index"
  get "aboutus/index"
  get "budgets/index"
  get "questions/index"



  root to: "welcome#index"

  devise_for :users

  resources :questions do
    resources :answers
  end

end

  #root "welcome#index"
