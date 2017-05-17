class CreateTimeDeposits < ActiveRecord::Migration[5.0]
  def change
    create_table :time_deposits do |t|
      t.belongs_to :member, foreign_key: true
      t.belongs_to :time_deposit_product, foreign_key: true
      t.decimal :amount
      t.datetime :date_deposited
      t.string :account_number, unique: true
      
      t.timestamps
    end
  end
end
