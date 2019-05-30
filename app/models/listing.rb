class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :book

  validates_presence_of :title, :body

  monetize :price_cents, :numericality => { greater_than: 0, less_than: 1000 }
end
