class ListingPolicy < ApplicationPolicy
  def update?
    user.present? && (record.seller == user || user.admin?)
  end
end