class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :listings, through: :taggings, 
                      source: :taggable, 
                      source_type: "Listing"

  validates_presence_of :name
end
