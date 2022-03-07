Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "sales_tax_calculators#new"

  resources :sales_tax_calculators, only: [:index, :new, :create]

end
