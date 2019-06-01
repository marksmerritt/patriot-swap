class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :users

  validates_presence_of :street, :city, :state, :zip

  def address
    [street, city, state, zip].compact.join(", ")
  end

  def address_changed?
    attrs = Location.validators.first.attributes
    attrs.any?{ |a| send "#{a}_changed?" }
  end
end
