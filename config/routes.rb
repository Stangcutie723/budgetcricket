BudgetCricket::Application.routes.draw do
  resources :budgets do
    resources :expenses
  end
  get "welcome/index"
  get "home/index"
  get "home/aboutbudget"
  get "home/contactus"

  root to: "welcome#index"


  #root "welcome#index"



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
=======
BudgetCricket::Application.routes.draw do
>>>>>>> 778bbc6bd690be7e1a669fe6bcb92240a303923c

  resources :budgets do
    resources :expenses
  end

  get "home/index"
  get "welcome/index"

  root to: "welcome#index"
end
