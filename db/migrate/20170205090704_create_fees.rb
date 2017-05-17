class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :type
      t.string :amount
      t.string :name
      t.integer :feeable_id
      t.string :feeable_type

      t.timestamps
    end
    add_index :fees, :feeable_id
    add_index :fees, :feeable_type
  end
end
