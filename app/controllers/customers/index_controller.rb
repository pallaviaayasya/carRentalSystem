class Customers::IndexController < ApplicationController
    before_action :authenticate_admin!

    def index
	    @customers = Customer.all.order("id")
    end
end
