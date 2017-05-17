class AddBranchToTimeDeposits < ActiveRecord::Migration[5.0]
  def change
    add_reference :time_deposits, :branch, foreign_key: true
  end
end
