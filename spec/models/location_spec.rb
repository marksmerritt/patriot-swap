require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:location) }.to change{ Location.count }.by(1)
    end

    it "geocodes on save" do 
      @location = FactoryBot.create(:location)
      expect(@location.longitude).to_not be_nil
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
  end
end
