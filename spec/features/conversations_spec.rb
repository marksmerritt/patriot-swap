require "rails_helper"

describe "navigation" do 
  describe "new" do 
    before do 
      @seller = FactoryBot.create(:user)
      @buyer = FactoryBot.create(:second_user)
      @book = FactoryBot.create(:book)
      @listing = FactoryBot.create(:listing, book: @book, seller: @seller)
      login_as(@buyer, scope: :user)
      visit listing_path(@listing)
    end

    context "when a conversation has not been started" do 
      it "has a link to start a conversation" do 
        expect { click_link "create-#{@seller.id}-#{@buyer.id}-conversation" }.to change{ Conversation.count }.by(1)
      end
    end

    context "when a conversation has been started" do 
      before do 
        click_link "create-#{@seller.id}-#{@buyer.id}-conversation" 
      end

      it "displays the conversation" do 
        expect(page).to have_css("#conversation-btw-#{@listing.seller.id}-#{@buyer.id}")
      end

      it "has a form to send messages" do 
        fill_in "new-message-body", with: "Hello world"
        click_button "send-message-btn"
        expect(page).to have_content(/#{@buyer.first_name}|Hello world/)
      end
    end
  end
end