class RemoveTotalCostFromLineItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :line_items, :total_cost, :decimal
  end
end
