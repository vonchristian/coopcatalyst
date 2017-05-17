class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.string :description
      t.string :unit
      t.attachment :photo
      t.boolean :stock_alert, default: false

      t.timestamps
    end
  end
end
