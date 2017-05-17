class RemoveDepartmentFromEntries < ActiveRecord::Migration[5.0]
  def change
    remove_reference :entries, :department, foreign_key: true
  end
end
