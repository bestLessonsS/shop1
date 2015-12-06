class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
