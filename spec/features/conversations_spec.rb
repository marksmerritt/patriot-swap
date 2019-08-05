require "rails_helper"

describe "navigation" do 
  describe "new" do 
    let(:seller) { FactoryBot.create(:user) }
    let(:buyer) { FactoryBot.create(:second_user) }
    let(:listing) { FactoryBot.create(:listing, seller: seller) }

    before do 
      login_as(buyer, scope: :user)
    end

    context "when a conversation has not been started" do 
      it "creates a conversation" do 
        expect { visit listing_path(listing) }.to change{ Conversation.count }.by(1)
      end
    end

    context "when a conversation has been started" do 
      let(:convo) { FactoryBot.create(:conversation, listing_id: listing.id, seller_id: seller.id, buyer_id: buyer.id) }
      
      before do 
        visit listing_path(convo.listing)
      end

      it "displays the conversation" do 
        expect(page).to have_css("#conversation-btw-#{listing.seller.id}-#{buyer.id}")
      end

      it "has a form to send messages" do 
        fill_in "new-message-body-#{buyer.id}", with: "Hello world"
        expect{ click_button "send-message-btn" }.to change{ Message.count }.by(1)
      end

      it "sends the recipient a notification" do 
        fill_in "new-message-body-#{buyer.id}", with: "Hello world"
        expect{ click_button "send-message-btn" }.to change{ seller.notifications.count }.by(1)
      end

      it "does not send multiple notifications for the same action" do 
        fill_in "new-message-body-#{buyer.id}", with: "Something"
        click_button "send-message-btn"
        
        visit listing_path(convo.listing)
        fill_in "new-message-body-#{buyer.id}", with: "Something Else"
        expect{ click_button "send-message-btn" }.to change{ seller.notifications.count }.by(0)
      end
    end
  end
end