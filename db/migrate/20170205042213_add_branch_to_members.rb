class AddBranchToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :branch, foreign_key: true
  end
end
