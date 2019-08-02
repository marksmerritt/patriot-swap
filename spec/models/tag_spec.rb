require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:tag) }.to change{ Tag.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:name) }
  end
end
