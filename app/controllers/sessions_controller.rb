class SessionsController < ApplicationController

	def login
		@user = User.new
	end

	def new
	end

	def create
		@user = User.find_by(username: params[:sessions][:username])
		if @user.authenticate(params[:sessions][:password])
			session[:id] = @user.id
			redirect_to @user
		else
			flash[:danger] = "Usuario y/o contraseña equivocados"
			render 'login'
		end
	end

end




# post '/log_in' do
# 	user = User.authenticate(params[:user][:username], params[:user][:password])

# 	if user
# 		# session[:name] = user.name
# 		session[:id] = user.id
# 		redirect to('/profile')
# 	else
# 		session[:errors] = "Usuario y/o contraseña equivocados"
# 		redirect to('/log_in')
# 	end
# end
