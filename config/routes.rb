BudgetCricket::Application.routes.draw do

  resources :budgets do
    resources :expenses
  end

  get "home/index"
  get "welcome/index"

  root to: "welcome#index"
end
