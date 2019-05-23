require "rails_helper"

describe "navigation" do 
  describe "index" do 
    it "displays a list of terms" do 
      @term1 = FactoryBot.create(:term)
      @term2 = FactoryBot.create(:second_term)

      visit terms_path
      expect(page).to have_content(/#{@term1.year}|#{@term1.season}|#{@term2.year}|#{@term2.season}/)
    end
  end

  describe "new" do 
    it "can be created from a form" do 
      visit new_term_path
      select "spring", from: "term[season]"
      fill_in "year-field", with: "2020"

      expect{ click_button "term-submit-btn" }.to change{ Term.count }.by(1)
    end
  end

  describe "show" do 
    let(:term) { FactoryBot.create(:term) }

    it "displays the correct attributes" do 
      visit term_path(term)
      expect(page).to have_content(term.year).and have_content(term.season)
    end
  end
end