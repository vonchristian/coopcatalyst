class AddTrackingNumberToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :tracking_number, :string
    add_index :loans, :tracking_number
  end
end
