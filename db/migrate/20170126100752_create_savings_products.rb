class CreateSavingsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :savings_products do |t|
      t.string :name
      t.decimal :interest_rate

      t.timestamps
    end
  end
end
