class BookingsController < ApplicationController
    before_action :authenticate_customer!

    def index
	@bookings = current_customer.bookings
    end

    def new
	@cars = Car.all
	@booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
		flash[:notice] = "Booking created for #{current_customer.name} against #{@booking.car_no}"
	else
		flash[:alert] = "Error encountered when booking for #{current_customer.name}"
	end
        redirect_to all_bookings_path
    end

    def destroy
        @booking = Booking.find(params[:format])
        @booking.destroy

        redirect_to all_bookings_path
    end

    private

    def booking_params
        params.require(:booking).permit(:customer_id, :booking_date, :returned_date, :booking_area, :car_no)
    end
end
