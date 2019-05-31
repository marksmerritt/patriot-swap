class Listing < ApplicationRecord
  has_rich_text :body

  belongs_to :seller, class_name: "User"
  belongs_to :book

  validates_presence_of :title

  monetize :price_cents, :numericality => { greater_than: 0, less_than: 1000 }

  def self.for_book(book)
    where(book: book)
  end
end
