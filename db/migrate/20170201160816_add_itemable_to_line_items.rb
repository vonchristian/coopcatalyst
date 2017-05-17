class AddItemableToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :itemable_id, :integer, index: true
    add_column :line_items, :itemable_type, :string, index: true
  end
end
