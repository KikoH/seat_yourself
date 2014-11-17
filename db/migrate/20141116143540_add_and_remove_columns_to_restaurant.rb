class AddAndRemoveColumnsToRestaurant < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :open_time
  	remove_column :restaurants, :close_time
  	add_column :restaurants, :open_time, :datetime
  	add_column :restaurants, :close_time, :datetime
  	remove_column :reservations, :book_time
  	add_column :reservations, :book_time, :datetime
  end
end
