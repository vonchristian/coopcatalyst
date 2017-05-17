class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.belongs_to :cooperative, foreign_key: true
      t.string :name
      t.string :address
      t.string :contact_number

      t.timestamps
    end
  end
end
