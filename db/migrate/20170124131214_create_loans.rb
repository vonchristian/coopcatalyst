class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.belongs_to :member, foreign_key: true
      t.belongs_to :loan_product, foreign_key: true
      t.decimal :amount
      t.datetime :application_date
      t.integer :status

      t.timestamps
    end
  end
end
