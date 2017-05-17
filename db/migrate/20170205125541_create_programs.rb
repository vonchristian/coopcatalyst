class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.decimal :contribution_amount

      t.timestamps
    end
  end
end
