class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :users

  validates_presence_of :street, :city, :state, :zip

  def address
    [street, city, state, zip].compact.join(", ")
  end

  def address_changed?
    street_changed? || city_changed? || state_changed? || zip_changed? 
  end
end
