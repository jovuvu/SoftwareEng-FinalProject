class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Sign the user in and redirect to user's profile
			sign_in user
			flash[:notice] = 'Welcome #{current_user.name_first} #{current_user.name_last}'
			redirect_to user
		else

			# Create an error message and re-render the form
			flash[:error] = 'Invalid email/password combination'
			redirect_to signin_path
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
