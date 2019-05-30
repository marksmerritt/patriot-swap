class Book < ApplicationRecord
  acts_as_ordered_taggable_on :course

  has_many :listings

  validates_presence_of :title, :isbn
end
