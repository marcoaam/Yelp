class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@restaurants = Restaurant.all
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :cuisine))

		if @restaurant.save
			redirect_to('/restaurants')
		else
			render 'new'
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :cuisine))
    flash[:notice] = 'Restaurant updated successfully'
    redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = 'Restaurant deleted successfully'
		redirect_to('/restaurants')
	end
	
end
