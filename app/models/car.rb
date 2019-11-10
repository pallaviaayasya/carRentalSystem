class Car < ApplicationRecord
	self.primary_key = "car_no"
	has_many :bookings
	has_many :customers, :through => :bookings


    def bookings car_no
	car_bookings = []
	Booking.all.each do |booking|
		if car_no == booking.car_no
			car_bookings << booking
		end
	end
	car_bookings
    end

end
