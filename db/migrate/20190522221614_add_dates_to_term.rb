class AddDatesToTerm < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :start_date, :date
    add_column :terms, :end_date, :date
  end
end
