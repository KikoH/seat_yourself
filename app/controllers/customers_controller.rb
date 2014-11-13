class CustomersController < ApplicationController
	def show
		@customer = User.find(params[:id])
	end

	def edit
		@customer = User.find(params[:id])
	end

	def update
		@customer = User.find(params[:id])
		if @customer.update_attributes(customers_params)
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
		@customer = User.find(params[:id])
		@customer.destroy
		redirect_to users_path
	end

	private
	def customers_params
		params.require(:customer).permit(:name, :email)
	end
end
