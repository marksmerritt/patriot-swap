require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "polymorphic attributes" do 
    it { is_expected.to have_db_column(:taggable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:taggable_type).of_type(:string) }

    it { is_expected.to belong_to(:taggable) }
  end
end
