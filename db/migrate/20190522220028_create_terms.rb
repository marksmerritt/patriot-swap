class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :year
      t.integer :season, default: 0

      t.timestamps
    end
  end
end
