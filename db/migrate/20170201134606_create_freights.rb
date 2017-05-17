class CreateFreights < ActiveRecord::Migration[5.0]
  def change
    create_table :freights do |t|
      t.string :type
      t.integer :freightable_id
      t.string :freightable_type
      t.decimal :amount

      t.timestamps
    end
    add_index :freights, :type
    add_index :freights, :freightable_id
    add_index :freights, :freightable_type
  end
end
