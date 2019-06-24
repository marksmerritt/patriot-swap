class Listing < ApplicationRecord
  Gutentag::ActiveRecord.call self
  include Taggable
    
  searchkick  

  has_rich_text :body
  has_many_attached :images
  has_many :conversations

  belongs_to :seller, class_name: "User"
  belongs_to :book

  validates_presence_of :title

  monetize :price_cents, :numericality => { greater_than: 0, less_than: 1000 }

  def self.for_book(book)
    where(book: book)
  end
end
