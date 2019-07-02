class AddConditionToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :condition, :integer, default: 0
  end
end
