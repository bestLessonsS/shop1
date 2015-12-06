class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.datetime :orderDate
      t.datetime :dateShipped
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
