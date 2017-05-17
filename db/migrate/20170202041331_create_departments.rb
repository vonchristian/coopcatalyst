class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.belongs_to :cooperative, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
