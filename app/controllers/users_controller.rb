class UsersController < ApplicationController
	class PasswordError < StandardError; end
	
	before_action :authorize_request, except: :create
	# before_action :find_user, except: %i[create index]

  	# GET /users
  	def index
  		@users = User.all
  		# binding.pry
  		render json: @users, status: :ok
  	end

  	# GET /users/{username}
  	def show

      render json: @current_user, status: :ok
    end

  	# POST /users
  	def create
  		
  		raise PasswordError if !(params[:password] == params[:password_confirmation])

  		@user = User.new(user_params)
  		if @user.save
  			render json: @user, status: :created
  		else
  			render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  		end
  	end

  	# PUT /users/{username}
  	def update

      # @user = User.find_by_username(params[:_username])
      unless @current_user.update(user_params)
        render json: { errors: @current_user.errors.full_messages },
        status: :unprocessable_entity
      end
    end

  	# DELETE /users/{username}
  	def destroy
  		@current_user.destroy
  	end

  	private

  	def user_params
  		params.permit(:name, :username, :fullname, :email, :password, :password_confirmation)
  	end
  end
