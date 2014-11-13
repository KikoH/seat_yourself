class OwnersController < ApplicationController
	def show
		@owner = User.find(params[:id])
	end

	def edit
		@owner = User.find(params[:id])
	end

	def update
		@owner = User.find(params[:id])
		if @owner.update_attributes(owners_params)
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
		@owner = User.find(params[:id])
		@owner.destroy
		redirect_to users_path
	end

	private
	def owners_params
		params.require(:owner).permit(:name, :email)
	end
end
