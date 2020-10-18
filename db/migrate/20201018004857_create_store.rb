class CreateStore < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, index: {unique: true}
      t.string :owner
      t.float :total, :default => 0.0

      t.timestamps
    end
  end
end
