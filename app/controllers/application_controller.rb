class ApplicationController < ActionController::API
	rescue_from "UsersController::PasswordError", with: :password_error
	def not_found
		render json: { error: 'not_found' }
	end

	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
			@decoded = JsonWebToken.decode(header)
			@current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
			render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
			render json: { errors: e.message }, status: :unauthorized
		end
	end

	def password_error
		error = {
			"status" => "401",
			"title" => "Password confiramtion not present",
			"detail" => "Password confirmation must be same as password"
		}

		render json:{errors: [error]}, status: 401

	end
	
end
