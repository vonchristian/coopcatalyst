class CreateOccupations < ActiveRecord::Migration[5.0]
  def change
    create_table :occupations do |t|
      t.string :title
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
