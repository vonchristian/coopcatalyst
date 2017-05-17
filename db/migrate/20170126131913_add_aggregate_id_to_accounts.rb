class AddAggregateIdToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :aggregate_account_id, :integer
    add_index :accounts, :aggregate_account_id
  end
end
