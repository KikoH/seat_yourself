class AddAndRemoveColumnsToRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :open_time
  	remove_column :restaurants, :close_time
  	add_column :restaurants, :open_time, :time
  	add_column :restaurants, :close_time, :time
  	remove_column :reservations, :book_time
  	add_column :reservations, :book_time, :time
  end
end
