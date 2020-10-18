class AddTransactionToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :store, null: true, foreign_key: true
  end
end
