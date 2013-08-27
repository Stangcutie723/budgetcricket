BudgetCricket::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_for :models
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :budgets do
    resources :expenses
  end

  resources :questions do
    resources :answers
  end

  get "users/sign_in"
  get "welcome/index"
  get "home/index"
  get "budgets/index"
  get "stories/index"
  get "posts/index"
  get "questions/index"
  get "aboutbudget/index"
  get "contactus/index"
  get "aboutus/index"
  get "users/sign_out"

  root to: "welcome#index"

end
