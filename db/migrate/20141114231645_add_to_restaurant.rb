class AddToRestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants, :open_time, :time
  	add_column :restaurants, :close_time, :time
  end
end
