class Conversation < ApplicationRecord
  belongs_to :listing

  has_many :messages

  validates_presence_of :seller_id, :buyer_id

  def self.for_listing(listing_id)
    where(listing_id: listing_id)
  end

  def self.between(seller_id, buyer_id) 
    where(seller_id: seller_id, buyer_id: buyer_id)
  end
end
