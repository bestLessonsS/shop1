class CreateOrderElements < ActiveRecord::Migration
  def change
    create_table :order_elements do |t|
      t.integer :amount
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
