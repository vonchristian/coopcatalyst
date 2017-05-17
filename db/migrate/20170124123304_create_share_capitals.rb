class CreateShareCapitals < ActiveRecord::Migration[5.0]
  def change
    create_table :share_capitals do |t|
      t.string :account_number
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
