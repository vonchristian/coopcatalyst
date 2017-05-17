class CreateLoanProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_products do |t|
      t.string :name
      t.decimal :interest_rate
      t.integer :status
      t.decimal :term

      t.timestamps
    end
  end
end
