class AddTypeToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :branch_type, :integer
    add_index :branches, :branch_type
  end
end
