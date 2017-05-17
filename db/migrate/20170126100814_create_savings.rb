class CreateSavings < ActiveRecord::Migration[5.0]
  def change
    create_table :savings do |t|
      t.belongs_to :member, foreign_key: true
      t.belongs_to :savings_product, foreign_key: true
      t.datetime :date_opened
      t.string :account_number, unique: true, index: true

      t.timestamps
    end
  end
end
