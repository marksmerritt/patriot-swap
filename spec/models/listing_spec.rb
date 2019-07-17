require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:listing) }.to change{ Listing.count }.by(1)
    end

    let(:listing) { FactoryBot.create(:listing) }

    it "is set to active by default" do 
      expect(listing.status).to eq("active")
    end
  end

  describe "validation" do 
    let(:listing) { FactoryBot.build_stubbed(:listing) }

    it "has a title" do 
      listing.title = nil
      expect(listing).to_not be_valid
    end

    it "has a condition" do 
      listing.condition = nil
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

  describe "attachments" do 
    let(:listing) { FactoryBot.create(:listing) }

    describe "images" do 
      it "can be attached" do 
        img = fixture_file_upload(Rails.root.join("public", "apple-touch-icon.png"), "image/png")
        expect{ listing.images.attach(img) }.to change{ ActiveStorage::Attachment.count }.by(1)
      end
    end
  end

  describe "scopes" do 
    before do 
      @listing1 = FactoryBot.create(:listing)
      @listing2 = FactoryBot.create(:second_listing)
    end

    describe ".for_book" do 
      it "returns the correct listings" do 
        expect(Listing.for_book(@listing1.book).first).to eq(@listing1)
      end

      it "does not return listings associated with other books" do 
        expect(Listing.for_book(@listing1.book).count).to eq(1)
      end
    end
  end
end
