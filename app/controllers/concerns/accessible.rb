module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if admin_signed_in?
      flash.clear
      redirect_to(all_cars_path) && return
    elsif customer_signed_in?
      flash.clear
      redirect_to(all_bookings_path) && return
    end
  end
end
