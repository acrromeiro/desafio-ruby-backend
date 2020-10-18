class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float "value", null: false
      t.string "cpf", null: false
      t.string "card", null: false
      t.datetime "transaction_date", null: false

      t.timestamps
    end
  end
end
