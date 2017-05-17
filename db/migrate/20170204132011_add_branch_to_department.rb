class AddBranchToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :branch, foreign_key: true
  end
end
