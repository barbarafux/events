class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def edit
	end

	def new
		@user = User.new
	end

	def edit
	end	

	def create
	  	@user = User.new(user_params)

	    respond_to do |format|
	      if params[:spam_filter] == "5" && @user.save
	        format.html { redirect_to @user, notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	      	flash.now[:error] = "Spam check fail."
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
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
		@user.destroy
		respond_to do |format|
			format.html { redirect_to user_url, notice: 'User was deleted.' }
			format.json { head :no_content }
		end
	end


private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email,
									 :password,
									 :password_confirmation,
									 :spam_filter
									 )
	end

end