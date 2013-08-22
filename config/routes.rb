BudgetCricket::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_for :models
  devise_for :users

  resources :budgets do
    resources :expenses
  end

  resources :questions do
    resources :answers
  end

  get "welcome/index"
  get "home/index"
  get "aboutbudget/index"
  get "contactus/index"
  get "aboutus/index"
  get "budgets/index"
  get "questions/index"
  get "stories/index"
  get "users/sign_out"
  get "users/sign_in"

  root to: "welcome#index"

end
