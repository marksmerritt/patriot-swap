class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable,
         :timeoutable, :lockable

  has_many :listings, foreign_key: "seller_id"

  validates_presence_of :first_name, :last_name
end
