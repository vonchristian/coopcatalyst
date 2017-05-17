class AddTypeToApprovals < ActiveRecord::Migration[5.0]
  def change
    add_column :approvals, :type, :string
    add_index :approvals, :type
  end
end
