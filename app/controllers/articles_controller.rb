# created during ArticlesController generator command (follow rails 6.1.7 tutorial)
class ArticlesController < ApplicationController
  def index
    # to fetch all articles from the database
    @articles = Article.all
    # Controller INSTANCE variables, can be accessed by the view
    # Meaning... we can reference @articles in app/views/articles/index.html.erb
  end

  def show
    # similar to [req.params.id] in Node/Express for endpoint of a SINGLE article
    @article = Article.find(params[:id])
    # by default, show action renders app/views/articles/show.html.erb
  end

  # Let's now create action methods for creating a new article
  def new
    @article = Article.new # instantiates new article, but DOESN'T SAVE
  end

  def create
    # instantiates AND saves new article to DB
    @article = Article.new(title: "...", body: "...") # dummy values, will change when we create form

    # on successful save, redirects to /article/:id
    if @article.save
      # !! NOTE !! important to use redirect_to after mutating DB, else req sent to same site and keeps making new articles
      redirect_to @article
    else
      # on failure, re-displays the form from views/articles/new.html.erb
      render :new
    end
  end


end

# Anything inside the index method here is delivered to the views html which the browser sees, served by our server (similarly to EJS)

# <% %> and <%= %> inside the HTML holds ERB (embedded ruby) code

# <% %> : Run the ERB here WITHOUT showing to views
# <%= %> : Run the ERB here AND show to views