class AddWalletBalanceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wallet_balance_cents, :integer, default: 0, null: false
  end 
end
