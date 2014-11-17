class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		
		# This is the equivalent of the .build method
		# @reservation = Reservation.new(reservation_params)
		# @reservation.restaurant = @restaurant 

		@reservation = @restaurant.reservations.build(reservation_params)

		@user = @restaurant.owner

		if @reservation.save
			redirect_to restaurants_path, notice: "Reservation created successfully"
		else
			render 'restaurants/show'
		end
	end

	private
	def reservation_params
		params.require(:reservation).permit(:date, :party_size, :book_time)
	end
end
