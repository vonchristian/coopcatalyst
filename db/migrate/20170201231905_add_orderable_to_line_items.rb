class AddOrderableToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :orderable_id, :integer
    add_index :line_items, :orderable_id
    add_column :line_items, :orderable_type, :string
    add_index :line_items, :orderable_type
  end
end
