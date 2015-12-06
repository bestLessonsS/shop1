class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
