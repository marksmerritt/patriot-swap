class AddPublishedDateToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :published_date, :string
  end
end
