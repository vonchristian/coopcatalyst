class RemoveCooperativeFromDepartment < ActiveRecord::Migration[5.0]
  def change
    remove_reference :departments, :cooperative, foreign_key: true
  end
end
