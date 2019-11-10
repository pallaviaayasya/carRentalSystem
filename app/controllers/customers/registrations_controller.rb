class Customers::RegistrationsController < Devise::RegistrationsController
	include Accessible
        skip_before_action :check_user, except: [:new, :create]

	private

	def sign_up_params
		params.require(:customer).permit(:name, :phone_no, :dl_no, :email, :password, :password_confirmation)
	end
end
