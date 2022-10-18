Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # all GET to '/articles' mapped to the 'index' class method/action of ArticlesController
  get "/articles", to: "articles#index"
  # to create 'ArticlesController' with index action, run controller generator following the 6.1 rails guide
end
