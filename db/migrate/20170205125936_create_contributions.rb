class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.belongs_to :member, foreign_key: true
      t.belongs_to :program, foreign_key: true
      t.decimal :amount
      t.datetime :date
      t.belongs_to :entry, foreign_key: true

      t.timestamps
    end
  end
end
