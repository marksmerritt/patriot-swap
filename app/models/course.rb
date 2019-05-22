class Course < ApplicationRecord
  validates_presence_of :code, :title
  validates_format_of :code, with: /\A[A-Z]{2,}[0-9]{3}\Z/
end
