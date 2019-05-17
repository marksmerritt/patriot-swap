require "rails_helper"

describe "navigation" do 
  context "when a user is not logged in" do 
    it "displays a link to sign in" do 
      visit root_path
      click_link "signin-link"

      expect(current_path).to eq(new_user_session_path)
    end

    it "displays a form for a user to sign in" do 
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "email-field", with: @user.email 
      fill_in "password-field", with: "helloworld"
      click_button "submit-btn"

      expect(page).to have_link("logout-link")
    end
  end
end