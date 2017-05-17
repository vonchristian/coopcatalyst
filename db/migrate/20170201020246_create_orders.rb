class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :pay_type
      t.datetime :order_date
      t.string :reference_number
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
