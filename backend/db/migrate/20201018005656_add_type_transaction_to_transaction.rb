class AddTypeTransactionToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :type_transaction, null: true, foreign_key: true
  end
end
