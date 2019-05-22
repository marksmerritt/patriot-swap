class Term < ApplicationRecord
  enum season: { fall: 0, spring: 1, summer: 2 }

  validates_presence_of :year, :season, :start_date, :end_date
  validates :year, numericality: true
  validate :end_after_start_date

  def end_after_start_date
    if self.end_date < self.start_date 
      errors.add(:end_date, "must be after the start date") 
    end
  end
end
