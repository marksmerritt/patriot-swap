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
      @book = FactoryBot.create(:book)
    end

    context "with valid input" do 
      before do 
        visit new_book_listing_path(@book)
        fill_in "title-field", with: "Some Great Title"
        find('#listing_condition').find(:xpath, 'option[2]').select_option
        fill_in "price-cents-field", with: "100.00"
        fill_in "listing[tags_attributes][0][name]", with: "IT100"
      end

      it "can be created from a form" do 
        expect{ click_button "listing-submit-btn" }.to change{ Listing.count }.by(1)
      end

      it "creates associated tags" do 
        expect{ click_button "listing-submit-btn" }.to change{ Tag.count }.by(1)
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

  describe "edit" do 
    before do 
      @listing = FactoryBot.create(:listing, seller: user)
    end

    it "can be edited" do 
      visit edit_listing_path(@listing)
      fill_in "title-field", with: "Something else"
      click_button "listing-submit-btn"

      expect(@listing.reload.title).to eq("Something else")
    end

    context "from the listing's show page" do 
      it "can be edited" do 
        visit listing_path(@listing)
        click_link "edit-listing-#{@listing.id}"

        expect(current_path).to eq(edit_listing_path(@listing))
      end
    end

    context "from the listing history page" do 
      it "can be edited" do
        visit listing_history_index_path
        click_link "edit-listing-#{@listing.id}"        

        expect(current_path).to eq(edit_listing_path(@listing))
      end
    end
  end

end




















