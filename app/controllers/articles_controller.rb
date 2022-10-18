# created during ArticlesController generator command (follow rails 6.1.7 tutorial)
class ArticlesController < ApplicationController
  def index
    # to fetch all articles from the database
    @articles = Article.all
    # Controller INSTANCE variables, can be accessed by the view
    # Meaning... we can reference @articles in app/views/articles/index.html.erb
  end
end

# Anything inside the index method here is delivered to the views html which the browser sees, served by our server (similarly to EJS)

# <% %> and <%= %> inside the HTML holds ERB (embedded ruby) code

# <% %> : Run the ERB here WITHOUT showing to views
# <%= %> : Run the ERB here AND show to views