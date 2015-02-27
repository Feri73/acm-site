class Post < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable
  belongs_to :category
end
