class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.integer :restaurant_id
      t.time :time
      t.date :date
      t.integer :party_size

      t.timestamps
    end
  end
end
