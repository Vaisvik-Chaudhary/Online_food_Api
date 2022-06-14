class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      
      t.timestamps
    end
  end
end
