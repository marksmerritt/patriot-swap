require 'rails_helper'

RSpec.describe Term, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:term) }.to change{ Term.count }.by(1)
    end
  end

  describe "validation" do 
    let(:term) { FactoryBot.create(:term) }

    it "has a year" do 
      term.year = nil
      expect(term).to_not be_valid
    end

    it "has a numeric year" do 
      term.year = "201h"
      expect(term).to_not be_valid
    end

    it "has a season" do 
      term.season = nil
      expect(term).to_not be_valid
    end

    it "has an end date after the start date" do 
      term.start_date = Date.today 
      term.end_date = Date.yesterday

      expect(term).to_not be_valid
    end
  end
end
