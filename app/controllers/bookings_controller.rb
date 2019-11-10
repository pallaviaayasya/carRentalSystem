require 'ostruct'

class BookingsController < ApplicationController
    before_action :authenticate_customer!

    def index
	@bookings = []
	begin
	  call_string = "CALL sp_booking_details(#{current_customer.id})"
	  ActiveRecord::Base.connection.execute(call_string).each(as: :hash, symbolize_keys: true) do |row|
            @bookings << OpenStruct.new(row)
	  end
	ensure
	  ActiveRecord::Base.connection.close
	end
    end

    def new
	@cars = Car.all
	@booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)

        resp = nil
        begin
	    resp = @booking.save
        rescue => error
	    puts error
	end

        if resp
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
        params.require(:booking).permit(:customer_id, :booking_date, :returned_date, :booking_area, :car_no, :card_no)
    end
end
