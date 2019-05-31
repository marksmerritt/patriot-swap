class Book < ApplicationRecord
  Gutentag::ActiveRecord.call self
  include Taggable

  has_many :listings

  validates_presence_of :title, :isbn
end
