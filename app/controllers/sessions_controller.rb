class SessionsController < ApplicationController

#	skip_before_filter :login_required, :only => :destroy

	def destroy
		reset_session
		flash[:notice] = "Successfully logged out"
		redirect_to root_path
	end

end
