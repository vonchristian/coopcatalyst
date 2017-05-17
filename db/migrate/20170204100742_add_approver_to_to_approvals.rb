class AddApproverToToApprovals < ActiveRecord::Migration[5.0]
  def change
    add_column :approvals, :approver_id, :integer
    add_index :approvals, :approver_id
    add_column :approvals, :approver_type, :string
    add_index :approvals, :approver_type
  end
end
