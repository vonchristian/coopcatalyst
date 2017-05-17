class AddBranchToLoans < ActiveRecord::Migration[5.0]
  def change
    add_reference :loans, :branch, foreign_key: true
  end
end
