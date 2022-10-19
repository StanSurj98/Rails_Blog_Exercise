Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Mapping our main/root page to the index action in articles controller
  root "articles#index"

  # This simple command generates all most common routes for a resource type
  # seriously, it creates GETs, PUTs, POSTs, DELETEs IMMEDIATELY
  # To inspect which routes were made console-> `bin/rails routes`
  resources :articles
  # The "Prefix" column + suffix of _url or _path form the names of path helpers 
  # For example, `article_path` helper returns "/articles/#{article.id}" when given an article.

  # an even BETTER way is to do <%= link_to arg1, arg2 %> as a helper in the ERB
  # arg1 = the link's text
  # arg2 = the link's destination
  # automatically calls the path helper of article_path inside the ERB in index.html.erb
end

# Remember this mantra...
# 1. CRUD requests from the client goes to here...
# 2. Route those endpoints to the correct controllers
# 3. GENERATE those controllers via the bin/rails generate [controller name]
# 4. Can either generate OR manually build the action methods for #index or #show
# 5. Instance variables inside the action methods (@articles) receive data from querying the DB using ActiveRecord!
# 6. Follow the route of the views html that then takes ERB to display the data
