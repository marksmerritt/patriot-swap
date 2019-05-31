class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  Gutentag::ActiveRecord.call self
  include Taggable

  has_many :listings

  validates_presence_of :title, :isbn
end
