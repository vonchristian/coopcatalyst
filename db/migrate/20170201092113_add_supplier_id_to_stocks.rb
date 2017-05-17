class AddSupplierIdToStocks < ActiveRecord::Migration[5.0]
  def change
    add_reference :stocks, :supplier, foreign_key: true
  end
end
