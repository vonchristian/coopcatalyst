class AddBranchToSavings < ActiveRecord::Migration[5.0]
  def change
    add_reference :savings, :branch, foreign_key: true
  end
end
