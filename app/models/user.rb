# TODO: Seperate location creation
class User < ApplicationRecord
  after_validation :set_location, on: [:create], unless: :location_present?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable,
         :timeoutable, :lockable

  delegate :longitude, :latitude, to: :location

  has_one_attached :avatar
  has_many :connected_accounts, dependent: :destroy
  has_many :listings, foreign_key: "seller_id", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id

  belongs_to :location, optional: true

  accepts_nested_attributes_for :location

  validates_presence_of :first_name, :last_name
  validates :phone, phone: true

  def display_name
    "#{self.first_name} #{self.last_name[0]}."
  end

  private

  def location_present?
    self.location.present?
  end

  def set_location
    location = Location.create(
      street: "4400 University Dr",
      city: "Fairfax",
      state: "VA",
      zip: "22030"
    )
    location.users << self
  end
end