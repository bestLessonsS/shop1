class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :genre
      t.string :media
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
