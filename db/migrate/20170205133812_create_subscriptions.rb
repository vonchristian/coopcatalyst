class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :member, foreign_key: true
      t.belongs_to :program, foreign_key: true

      t.timestamps
    end
  end
end
