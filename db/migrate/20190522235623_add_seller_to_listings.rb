class AddSellerToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :seller_id, :integer, index: true, foreign_key: true
  end
end
