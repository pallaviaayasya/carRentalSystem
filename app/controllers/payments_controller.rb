class PaymentsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @payments = current_customer.payments
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      flash[:notice] = 'Payment instrument was successfully created'
    else
      flash[:notice] = 'Error while creating payment instrument'
    end
    redirect_to all_payments_path
  end

  private

    def payment_params
      params.require(:payment).permit(:customer_id, :card_type, :card_no, :expiry_date, :cvv)
    end
end
