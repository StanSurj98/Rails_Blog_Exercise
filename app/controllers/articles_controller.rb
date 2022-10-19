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

  # GET `/articles/new` goes to this `new` method, you can fill form but doesn't save yet...
  def new
    @article = Article.new # instantiates new article, but DOESN'T SAVE
  end

  # Hitting SUBMIT => POST `/articles` and maps to this `create` method
  # attempts to save and checks validation for the new article instance
  def create
    # Now during instatiating new article, it uses the filtered params in our private method below!
    @article = Article.new(article_params)

    # on successful save, redirects to /article/:id
    if @article.save
      # !! NOTE !! important to use redirect_to after mutating DB, else req sent to same site and keeps making new articles
      redirect_to @article
    else
      # on failure, re-displays the form from views/articles/new.html.erb
      render :new
    end
  end


  # Editing articles, GET `edit_article_path` maps to this action
  # !! Reminder !! `bin/rails routes` shows available generated paths
  def edit
    @article = Article.find(params[:id])
  end

  # POST/PUT `/articles/:id` maps to update
  # Notice how `edit` and `update` resembles `new` and `create`? convention is great
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # At this point, /views.../new.html.erb and /edit.html.erb should look pretty much the same
  # We'll refactor and make a new partial to render a form page
  # /views.../_form.html.erb


  # Deleting! => Our resourceful routes already mapped:
  # DELETE /articles/:id to our `destroy` action here
  def destroy
    # Finds the correct article in DB by id, deletes it, returns to root path
    @article = Article.find(params[:id])
    @article.destroy

    # Again, we don't NEED to go to root path, just chose to
    redirect_to_root_path
  end


  private
    # Protects us against form injection, cleans up the `form data`
    def article_params
      params.require(:article).permit(:title, :body)
    end


end

# Anything inside the index method here is delivered to the views html which the browser sees, served by our server (similarly to EJS)

# <% %> and <%= %> inside the HTML holds ERB (embedded ruby) code

# <% %> : Run the ERB here WITHOUT showing to views
# <%= %> : Run the ERB here AND show to views