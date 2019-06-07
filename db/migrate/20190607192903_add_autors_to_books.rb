class AddAutorsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :authors, :text, array: true, default: []
  end
end
