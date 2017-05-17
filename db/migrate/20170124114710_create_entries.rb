class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :reference_number
      t.datetime :entry_date
      t.string :commercial_document_type, index: true
      t.integer :commercial_document_id, index: true
      t.string :description
      t.integer :recorder_id, index: true
      
      t.timestamps
    end
  end
end
