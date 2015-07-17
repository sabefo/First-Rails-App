class UsersController < ApplicationController

	def index
		@user = User.new
	end
	
	def new
	end

	def show
		user_id = params[:id]
		@user = User.find(user_id)
	end

	def create
		session[:name] = params[:user][:name]
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to @user

		else
			flash[:danger] = "Ese usuario ya existe"
			render 'index'
		end
	end

 private
    def user_params
      params.require(:user).permit(:name, :username, :password)
    end

end



