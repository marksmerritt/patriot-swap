require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:listing) }.to change{ Listing.count }.by(1)
    end
  end

  describe "validation" do 
    let(:listing) { FactoryBot.build_stubbed(:listing) }

    it "has a title" do 
      listing.title = nil
      expect(listing).to_not be_valid
    end

    it "has a body" do 
      listing.body = nil
      expect(listing).to_not be_valid
    end

    it "has a monetized price" do 
      is_expected.to monetize(:price).with_currency(:usd)
    end

    it "has a price >= 0" do 
      listing.price_cents = -1
      expect(listing).to_not be_valid
    end

    it "has a price <= 1000" do 
      listing.price_cents = 100001
      expect(listing).to_not be_valid
    end
  end
end
