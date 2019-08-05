require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:notification) }.to change{ Notification.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:recipient_id) }
    it { should validate_presence_of(:actor_id) }
    it { should validate_presence_of(:action) }
  end
end
