class AddCurrentToOccupations < ActiveRecord::Migration[5.0]
  def change
    add_column :occupations, :current, :boolean
  end
end
