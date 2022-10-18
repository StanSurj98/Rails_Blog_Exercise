Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # Mapping our main/root page to the index action in articles controller
  root "articles#index"





  # all GET to '/articles' mapped to the 'index' class method/action of ArticlesController
  get "/articles", to: "articles#index"
  # to create 'ArticlesController' with index action, run controller generator following the 6.1 rails guide

  # Next route, we want to view the article in full, title AND body
  get "/articles/:id", to: "articles#show" 
  # similarly, hand off to articles controller, but SHOW action this time
  # :id = params[:id] (similar to Express and Node!!)

end

# Remember this mantra...
# 1. CRUD requests from the client goes to here...
# 2. Route those endpoints to the correct controllers
# 3. GENERATE those controllers via the bin/rails generate [controller name]
# 4. Can either generate OR manually build the action methods for #index or #show
# 5. Instance variables inside the action methods (@articles) receive data from querying the DB using ActiveRecord!
# 6. Follow the route of the views html that then takes ERB to display the data
