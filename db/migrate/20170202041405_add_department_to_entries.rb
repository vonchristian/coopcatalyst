class AddDepartmentToEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :department, foreign_key: true
  end
end
