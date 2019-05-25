class Book < ApplicationRecord
  has_many :listings

  validates_presence_of :title, :isbn
end
