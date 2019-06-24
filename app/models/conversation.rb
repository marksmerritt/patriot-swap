class Conversation < ApplicationRecord
  belongs_to :listing

  validates_presence_of :seller_id, :buyer_id
end
