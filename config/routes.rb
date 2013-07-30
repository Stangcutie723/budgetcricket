Budgettracker::Application.routes.draw do

  resources :budgets do
    resources :expenses
  end

  root to: "budgets#index"
end
