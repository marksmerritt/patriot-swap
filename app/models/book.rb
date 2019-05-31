class Book < ApplicationRecord
  include Taggable
  Gutentag::ActiveRecord.call self

  has_many :listings

  validates_presence_of :title, :isbn
end
