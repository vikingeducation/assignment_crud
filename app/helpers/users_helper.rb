module UsersHelper
	def user_params
		params.require(:user).permit(:first_name, :last_name, :bio)
	end
end
