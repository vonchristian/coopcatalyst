class CreateCooperatives < ActiveRecord::Migration[5.0]
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.string :accreditation_number
      t.string :address
      t.string :contact_number

      t.timestamps
    end
  end
end
