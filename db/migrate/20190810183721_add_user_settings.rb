class AddUserSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :settings, :jsonb, null: false, default: {}
  end
end
