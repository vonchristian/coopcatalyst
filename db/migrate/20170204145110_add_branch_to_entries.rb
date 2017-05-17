class AddBranchToEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :branch, foreign_key: true
  end
end
