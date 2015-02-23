class RestaurantsController < ApplicationController
	before_filter :ensure_owner, only: [:new, :create]

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		unless current_user.nil?
			if current_user.type == "Customer"
				@reservation = @restaurant.reservations.build
			end
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.owner_id = current_user.id
		if @restaurant.save
			redirect_to restaurant_path(@restaurant)
		else
			render :new
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurants_path
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :location, :owner_id, :capacity, :open_time, :close_time, :description, :picture)
	end


end
