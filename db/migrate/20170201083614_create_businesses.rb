class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :name
      t.string :contact_number
      t.string :address

      t.timestamps
    end
    add_index :businesses, :owner_id
    add_index :businesses, :owner_type
  end
end
