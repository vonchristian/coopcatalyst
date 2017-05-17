class AddUserToApprovals < ActiveRecord::Migration[5.0]
  def change
    add_reference :approvals, :user, foreign_key: true
  end
end
