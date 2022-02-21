Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # root to: "sales_tax_calculators#index"

  root to: "/sales_tax_calculators/new", to: "sales_tax_calculators#new"
  get "/sales_tax_calculators",          to: "sales_tax_calculators#index"
  post "/sales_tax_calculators/create",  to: "sales_tax_calculators#create"

  #get "/articles", to: "articles#index"
end
