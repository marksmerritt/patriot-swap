require 'rails_helper'

RSpec.describe Term, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:term) }.to change{ Term.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:year) }
    it { should validate_numericality_of(:year) }
    it { should validate_presence_of(:season) }
  end
end
