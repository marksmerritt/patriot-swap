class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable,
         :timeoutable, :lockable

  delegate :longitude, :latitude, to: :location

  has_one_attached :avatar
  has_many :connected_accounts
  has_many :listings, foreign_key: "seller_id"
  has_many :messages

  belongs_to :location, optional: true

  accepts_nested_attributes_for :location

  validates_presence_of :first_name, :last_name
end
