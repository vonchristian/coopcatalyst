class CreateDisbursements < ActiveRecord::Migration[5.0]
  def change
    create_table :disbursements do |t|
      t.integer :disbursementable_id
      t.string :disbursementable_type
      t.datetime :date
      t.string :reference_number
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :disbursements, :disbursementable_id
    add_index :disbursements, :disbursementable_type
  end
end
