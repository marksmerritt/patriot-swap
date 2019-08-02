class Book < ApplicationRecord
  SEARCHABLE_ATTRS = ["isbn", "title"].freeze

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :listings
  include Taggable

  has_one_attached :image

  validates_presence_of :title, :isbn
end
