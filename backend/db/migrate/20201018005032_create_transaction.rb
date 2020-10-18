class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :abs_value, null: false
      t.string :cpf, null: false
      t.string :card, null: false
      t.datetime :date_transaction, null: false

      t.timestamps
    end
  end
end
