class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def edit
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: 'User created.'
		else
			render :new
		end
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was updated.' }
				format.json { render :show, status: :ok, location: @user}
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end		
	end

	def destroy
	end


private

	def user_params
		params.require(:user).permit(:email,
									 :password,
									 :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end

end