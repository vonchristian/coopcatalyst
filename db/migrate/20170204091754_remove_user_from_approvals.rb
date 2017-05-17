class RemoveUserFromApprovals < ActiveRecord::Migration[5.0]
  def change
    remove_reference :approvals, :user, foreign_key: true
  end
end
