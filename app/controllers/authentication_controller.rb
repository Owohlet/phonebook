class AuthenticationController < ApplicationController
	before_action :authorize_request, except: :login

  # POST /auth/login
  def login
  	
  	response = UserAuthenticator.new(params).perform
  	if response
  		render json: { token: response[0], exp: response[1].strftime("%m-%d-%Y %H:%M"),username: response[2] }, status: :ok
  	else
  		render json: { error: 'unauthorized' }, status: :unauthorized
  	end

  end

  private

  def login_params
  	params.permit(:email, :password)
  end
end
