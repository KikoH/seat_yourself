class AddRemoveColums < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :open_time
  	remove_column :restaurants, :close_time
  	add_column :restaurants, :open_time, :integer
  	add_column :restaurants, :close_time, :integer
  	remove_column :reservations, :time
  	add_column :reservations, :book_time, :integer
  end
end
