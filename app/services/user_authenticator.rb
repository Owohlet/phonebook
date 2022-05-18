require 'pry'
class UserAuthenticator

	attr_reader :params
	def initialize(params)
		@user = User.find_by_email(params[:email])
		@params = params
	end

	def perform
		# binding.pry
		if @user && (BCrypt::Password.new(@user.password_digest) == params[:password])
			token = JsonWebToken.encode(user_id: @user.id)
			time = Time.now + 24.hours.to_i

			
			response = [token, time, @user.username]
			return response
		end
	end
end