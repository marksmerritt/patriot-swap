class AddPriceToListing < ActiveRecord::Migration[6.0]
  def change
    add_monetize :listings, :price, currency: { present: false }
  end
end
