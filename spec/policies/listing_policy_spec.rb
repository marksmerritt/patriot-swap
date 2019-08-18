require "rails_helper"

describe ListingPolicy do
  subject { described_class }

  permissions :update?, :edit? do
    let(:user) { FactoryBot.create(:user) } 
    let(:admin_user) { FactoryBot.create(:admin_user) } 
    
    it "denies access if the user is not the seller" do
      expect(subject).not_to permit(user, Listing.new(seller: admin_user))
    end

    it "grants access is the user is an admin" do 
      expect(subject).to permit(admin_user, Listing.new(seller: user))
    end
  end
end