require "rails_helper"

describe "help pages" do 
  describe "conditions" do 
    it "is reachable" do 
      visit conditions_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "privacy" do 
    it "is reachable" do 
      visit privacy_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "FAQs" do 
    it "is reachable" do 
      visit faq_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "contact" do 
    it "is reachable" do 
      visit contact_path
      expect(page.status_code).to eq(200)
    end
  end
end