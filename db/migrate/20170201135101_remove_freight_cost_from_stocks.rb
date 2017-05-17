class RemoveFreightCostFromStocks < ActiveRecord::Migration[5.0]
  def change
    remove_column :stocks, :freight_cost, :decimal
  end
end
