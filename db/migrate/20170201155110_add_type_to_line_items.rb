class AddTypeToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :type, :string
    add_index :line_items, :type
  end
end
