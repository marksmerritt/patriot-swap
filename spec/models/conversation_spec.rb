require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:conversation) }.to change{ Conversation.count }.by(1)
    end
  end

  describe "validations" do 
    subject { FactoryBot.create(:conversation) }

    it { should belong_to(:listing) }
    it { should validate_presence_of(:seller_id) }
    it { should validate_presence_of(:buyer_id) }
    it { should validate_uniqueness_of(:seller_id).scoped_to(:buyer_id) }
  end
end
