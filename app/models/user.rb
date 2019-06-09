class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable,
         :timeoutable, :lockable

  delegate :longitude, :latitude, to: :location

  has_many :listings, foreign_key: "seller_id"
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users 
  has_many :messages

  belongs_to :location

  accepts_nested_attributes_for :location

  validates_presence_of :first_name, :last_name
end
