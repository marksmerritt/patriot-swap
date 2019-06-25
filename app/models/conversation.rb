class Conversation < ApplicationRecord
  belongs_to :listing

  has_many :messages

  validates_presence_of :seller_id, :buyer_id
  validates_uniqueness_of :seller_id, scope: :buyer_id
end
