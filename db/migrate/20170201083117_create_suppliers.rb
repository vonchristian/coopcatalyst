class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number

      t.timestamps
    end
  end
end
