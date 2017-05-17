class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.integer :discountable_id
      t.string :discountable_type
      t.integer :discount_type
      t.decimal :amount
      t.decimal :percent

      t.timestamps
    end
    add_index :discounts, :discountable_id
    add_index :discounts, :discountable_type
    add_index :discounts, :discount_type
  end
end
