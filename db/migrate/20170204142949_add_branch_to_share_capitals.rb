class AddBranchToShareCapitals < ActiveRecord::Migration[5.0]
  def change
    add_reference :share_capitals, :branch, foreign_key: true
  end
end
