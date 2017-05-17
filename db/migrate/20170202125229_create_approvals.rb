class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.integer :approvable_id
      t.string :approvable_type
      t.datetime :date
      t.string :remarks
      t.string :reference_number

      t.timestamps
    end
    add_index :approvals, :approvable_id
    add_index :approvals, :approvable_type
  end
end
