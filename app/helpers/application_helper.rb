module ApplicationHelper

	def current_user
		id = session[:id]
		user = User.find(id)
	end

end
