class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :owner_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
