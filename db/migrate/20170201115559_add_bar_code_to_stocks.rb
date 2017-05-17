class AddBarCodeToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :bar_code, :string
  end
end
