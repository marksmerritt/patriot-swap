class DropTagTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :taggings
    drop_table :tags, foreign_key: true, index: true
  end
end
