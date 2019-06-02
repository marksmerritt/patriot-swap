require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) } 

  before do 
    login_as(user, :scope => :user)
  end

  describe "index" do 
    it "displays listings" do 
      @listing1 = FactoryBot.create(:listing)
      @listing2 = FactoryBot.create(:second_listing)

      visit book_listings_path(@listing1.book)
      expect(page).to have_content(/#{@listing1.title}|#{@listing2.title}/)
    end
  end

  describe "new" do 
    before do 
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      @book = FactoryBot.create(:book)
    end

    # TODO: Form field helper
    context "with valid input" do 
      it "can be created from a form" do 
        visit new_book_listing_path(@book)
        fill_in "title-field", with: "Some Great Title"
        fill_in "price-cents-field", with: "10000"
        fill_in "tag-names-field", with: "IT400"

        expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(1)
      end
    end

    context "with invalid input" do 
      it "is not created from the form" do 
        visit new_book_listing_path(@book)
        fill_in "title-field", with: "So"
        fill_in "price-cents-field", with: "10000000"

        expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(0)
      end
    end
  end

  describe "show" do 
    let(:listing) { FactoryBot.create(:listing) }

    it "displays the correct attributes" do 
      visit book_listing_path(listing.book, listing)
      expect(page).to have_content(listing.title)
    end
  end
end