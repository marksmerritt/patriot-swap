class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"

  validates_presence_of :title, :body
end
