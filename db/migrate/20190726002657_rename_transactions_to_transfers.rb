class RenameTransactionsToTransfers < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :transfers
  end
end
