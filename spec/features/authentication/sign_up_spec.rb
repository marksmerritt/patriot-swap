require "rails_helper"

describe "naviation" do 
  context "when a user is not logged in" do 
    it "displays a signup link" do 
      visit root_path
      click_link "signup-link"
      expect(current_path).to eq(new_user_registration_path)
    end

    it "has a form for a user to signup" do 
      visit new_user_registration_path
      fill_in "first-name-field", with: "John"
      fill_in "last-name-field", with: "Doe"
      fill_in "email-field", with: "john@example.com"
      fill_in "password-field", with: "helloworld"
      fill_in "password-confirmation-field", with: "helloworld"

      expect{ click_button "submit-btn" }.to change{ User.count }.by(1)
    end
  end

  context "when a user is logged in" do 
    let(:user) { FactoryBot.create(:user) }

    before do 
      login_as(user, :scope => :user)
    end

    it "does not display a signup link" do 
      visit root_path
      expect(page).to_not have_link("signup-link")
    end
  end
end