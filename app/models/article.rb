# generated this with: bin/rails generate model Article title:string body:text
# note how Article is singular, just like when using AR for Article.create(...)
  # we want the model to be singular so tables are "articles" in plural

class Article < ApplicationRecord
end
