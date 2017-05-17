class CreateRefunds < ActiveRecord::Migration[5.0]
  def change
    create_table :refunds do |t|
      t.integer :refundable_id
      t.string :refundable_type
      t.decimal :amount
      t.integer :refund_type
      t.decimal :percent

      t.timestamps
    end
    add_index :refunds, :refundable_id
    add_index :refunds, :refundable_type
    add_index :refunds, :refund_type
  end
end
