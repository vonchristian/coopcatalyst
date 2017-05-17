class AddTypeToShareCapitals < ActiveRecord::Migration[5.0]
  def change
    add_column :share_capitals, :type, :string
    add_index :share_capitals, :type
  end
end
