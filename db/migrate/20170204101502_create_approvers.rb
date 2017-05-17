class CreateApprovers < ActiveRecord::Migration[5.0]
  def change
    create_table :approvers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :type, index: true

      t.timestamps
    end
  end
end
