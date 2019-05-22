class Term < ApplicationRecord
  enum season: { fall: 0, spring: 1, summer: 2 }

  validates_presence_of :year, :season

  validates :year, numericality: true
end
