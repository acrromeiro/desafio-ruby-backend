class CreateTypeTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :type_transactions do |t|
      t.integer :external_id, index: {unique: true}
      t.string :description
      t.string :order, null: false

      t.timestamps
    end
  end
end
