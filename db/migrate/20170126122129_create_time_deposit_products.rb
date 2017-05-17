class CreateTimeDepositProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :time_deposit_products do |t|
      t.string :name
      t.decimal :interest_rate
      t.decimal :starting
      t.decimal :ending
      t.timestamps
    end
  end
end
