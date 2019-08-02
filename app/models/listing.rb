class Listing < ApplicationRecord
  enum status: { active: 0, inactive: 1 }
  enum condition: { brand_new: 0, good: 1, fair: 2, poor: 3 }
    
  searchkick  

  has_rich_text :body
  has_many_attached :images
  has_many :conversations
  include Taggable

  belongs_to :seller, class_name: "User"
  belongs_to :book

  validates_presence_of :title, :condition

  monetize :price_cents, numericality: { greater_than: 0, less_than: 1000 }

  def self.for_book(book)
    where(book: book)
  end

  def self.expired
    where("updated_at <= ?", 30.days.ago)
  end

  # TODO: Refactor
  def has_messages?
    conversations.includes(:messages).each do |conversation|
      return true if conversation.messages.any?
    end
    false
  end
end
