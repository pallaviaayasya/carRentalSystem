class Booking < ApplicationRecord
	belongs_to :customer
	belongs_to :car, class_name: "Car", foreign_key: "car_no"
end
