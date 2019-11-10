class CarsController < ApplicationController
    before_action :authenticate_admin!

    def index
        @cars = Car.all.order("created_at DESC")
    end

    def create
        @car = Car.new(car_params)

        if @car.save
		flash[:notice] = "Booking #{@car.car_no} created"
	else
		flash[:alert] = "Error encountered when creating car"
        end
        redirect_to all_cars_path
    end

    def destroy
        @car = Car.find(params[:format])
        @car.destroy

        redirect_to all_cars_path
    end

    private

    def car_params
        params.require(:car).permit(:car_no, :car_type, :car_city, :car_area, :car_name, :rate)
    end
end
