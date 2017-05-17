class CreateAccountingAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, unique: true, null: false, default: ""
      t.string :type
      t.string :code, unique: true
      t.boolean :contra, default: false

      t.timestamps
    end
    add_index :accounts, :type
    add_index :accounts, :name
  end
end
