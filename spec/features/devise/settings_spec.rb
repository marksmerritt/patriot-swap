require "rails_helper"

describe "User settings" do 
  describe "edit" do 
    before do 
      @subscribed_user = FactoryBot.create(:subscribed_user) 
      login_as(@subscribed_user, scope: :user)
      visit edit_user_registration_path
    end

    it "allows a user to unsubscribe from emails" do 
      click_link "toggle-email-subscription-link"
      expect(@subscribed_user.reload.subscribed_to_emails?).to be false
    end

    it "allows a user to resubscribe to emails" do 
      click_link "toggle-email-subscription-link"
      click_link "toggle-email-subscription-link"
      expect(@subscribed_user.reload.subscribed_to_emails?).to be true
    end
  end
end