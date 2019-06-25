require "rails_helper"

describe "navigation" do 
  describe "new" do 
    let(:seller) { FactoryBot.create(:user) }
    let(:buyer) { FactoryBot.create(:second_user) }
    let(:book) { FactoryBot.create(:book) }
    let(:listing) { FactoryBot.create(:listing, book: book, seller: seller) }

    before do 
      login_as(buyer, scope: :user)
      visit listing_path(listing)
    end

    context "when a conversation has not been started" do 
      it "has a link to start a conversation" do 
        expect { click_link "create-#{seller.id}-#{buyer.id}-conversation" }.to change{ Conversation.count }.by(1)
      end
    end

    context "when a conversation has been started" do 
      before do 
        click_link "create-#{seller.id}-#{buyer.id}-conversation" 
      end

      it "displays the conversation" do 
        expect(page).to have_css("#conversation-btw-#{listing.seller.id}-#{buyer.id}")
      end

      it "has a form to send messages" do 
        fill_in "new-message-body-#{buyer.id}", with: "Hello world"
        expect{ click_button "send-message-btn" }.to change{ Message.count }.by(1)
      end
    end
  end
end