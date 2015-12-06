class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :amountAvailable
      t.string :type
      t.string :genre
      t.string :media
      t.string :author

      t.timestamps null: false
    end
    add_index :products, :name
    add_index :products, :price
  end
end
