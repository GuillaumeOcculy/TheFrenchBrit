class UsersController < ApplicationController

	before_action :require_no_user, only: [:new, :create]
	before_action :find_user, only: [:show, :edit, :update]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			set_current_user(@user)
			redirect_to root_url, flash: {success: 'User account created !'}
		else
			render :new
			flash[:warning] = 'User has not been created !'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to root_url, flash: {success: 'User account updated !'}
		else
			render :edit
			flash[:warning] = 'User has not been updated !'
		end
	end

	def password_forgot
		if request.post?
			@user = User.search_by_email_for_authentication(params[:email]).first
			if @user
				UserMailer.reset_password(@user.id).deliver_later

				redirect_to root_url
			end
		end
	end

	def reset_password
		user = User.where(password_token: params[:token]).first
		if user
			set_current_user(user)

			user.generate_new_token(:password_token)
			user.save

			redirect_to root_url
		else
			redirect_to root_url
		end
	end

private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :password)
	end

	def find_user
		@user = User.friendly.find(params[:id])
	end

end
