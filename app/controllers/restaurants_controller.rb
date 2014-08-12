class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
		@review = Review.new
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name, :cuisine))
		redirect_to('/restaurants')
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
