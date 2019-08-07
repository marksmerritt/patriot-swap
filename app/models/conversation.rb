class Conversation < ApplicationRecord
  belongs_to :listing
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  has_many :messages, dependent: :destroy

  validates_presence_of :seller_id, :buyer_id

  def self.for_listing(listing_id)
    where(listing_id: listing_id)
  end

  def self.between(seller_id, buyer_id) 
    where(seller_id: seller_id, buyer_id: buyer_id)
  end
end
