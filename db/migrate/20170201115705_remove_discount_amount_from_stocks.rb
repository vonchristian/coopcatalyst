class RemoveDiscountAmountFromStocks < ActiveRecord::Migration[5.0]
  def change
    remove_column :stocks, :discount_cost, :decimal
  end
end
