class SessionsController < ApplicationController
  def create
  	user = User.find_by(email: params[:email])
  	if user && user.type == "Owner" && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to owner_path(user), notice: "Logged in as Owner!"
  	elsif user && user.type == "Customer" && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to customer_path(user), notice: "Logged in as Customer!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to restaurants_path, notice: "GTFO!"
  end
end

