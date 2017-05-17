class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :product, foreign_key: true, index: true
      t.decimal :quantity
      t.datetime :date_purchased
      t.decimal :purchase_cost
      t.string :reference_number
      t.datetime :expiry_date
      t.decimal :retail_price
      t.decimal :wholesale_price
      t.integer :payment_type
      t.boolean :discounted, default: false
      t.decimal :discount_cost
      t.boolean :has_freight, default: false
      t.decimal :freight_cost

      t.timestamps
    end
  end
end
