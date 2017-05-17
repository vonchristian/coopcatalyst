class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.decimal :quantity
      t.decimal :unit_cost
      t.decimal :total_cost
      t.integer :pricing_type
      t.belongs_to :stock, foreign_key: true

      t.timestamps
    end
  end
end
