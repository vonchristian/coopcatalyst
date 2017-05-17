class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :relationee_id
      t.integer :relationer_id
      t.integer :relationship_type, index: true
      t.timestamps
    end
    add_index :relationships, :relationee_id
    add_index :relationships, :relationer_id
    add_index :relationships, [:relationee_id, :relationer_id], unique: true
  end
end
