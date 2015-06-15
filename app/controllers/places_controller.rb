class PlacesController < ApplicationController
	before_action :logged_in?
	before_action :set_user_place, only: [:edit, :update, :destroy]

	def index
		@places = current_user.places
	end

	def new
		@place = Place.new
	end

	def create
		place = current_user.places.new(place_params)
		if place.save
			redirect_to place_path(place)
		else
			redirect_to new_place_path
		end
	end

	def show
		@place = Place.find_by({id: params[:id]})

	end

	def edit
	end

	def update
		if @place.update_attributes(place_params)
			redirect_to place_path(@place)
		else
			redirect_to edit_place_path(@place)
		end
	end

	def destroy
		@place.destroy()
	end

	private

	def place_params
		params.require(:place).permit(:name, :picture)
	end

	def set_user_place
		@place = current_user.places.find_by({:id, params[:id]})
		unless @place
			redirect_to places_path
		end
	end
end
