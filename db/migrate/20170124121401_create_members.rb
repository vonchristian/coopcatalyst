class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_number
      t.string :email
      t.integer :sex
      t.integer :civil_status
      t.date :date_of_birth
      t.attachment :photo

      t.timestamps
    end
  end
end
