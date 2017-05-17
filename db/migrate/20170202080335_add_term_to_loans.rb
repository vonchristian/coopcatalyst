class AddTermToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :term, :decimal
  end
end
