class CreateShareCapitalProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :share_capital_products do |t|
      t.decimal :minimum_paid_up_share_capital

      t.timestamps
    end
  end
end
