class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		#@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			redirect_to '/'
		else
			redirect_to 'signup'
		end
	end

	def update
	end

	def edit
	end

	def destroy
		@event.destroy
		respond_to do |format|
			format.html { redirect_to event_url, notice: 'User was deleted.' }
			format.json { head :no_content }
		end
	end
end

private

	def set_user
		user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end