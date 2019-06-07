class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  Gutentag::ActiveRecord.call self
  include Taggable

  has_many :listings

  has_one_attached :image

  validates_presence_of :title, :isbn
end
