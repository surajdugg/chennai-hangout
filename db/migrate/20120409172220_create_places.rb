class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :avg_price
      t.integer :ranking
      t.references :city

      t.timestamps
    end
    add_index :places, :city_id
  end
end
