# generated this with: bin/rails generate model Article title:string body:text
# note how Article is singular, just like when using AR for Article.create(...)
  # we want the model to be singular so tables are "articles" in plural

class Article < ApplicationRecord
  # Add in validation for when users create new articles
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end

# Note: 
# ActiveRecord automatically defined :title, :body, :other_model_attributes
# automatically for each table column, no need to define it ourselves