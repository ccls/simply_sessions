require 'action_controller'

module SimplySessions::Controller

	def self.included(base)
		base.helper_method :current_user, :logged_in?
		base.extend(ClassMethods)
		base.send(:include, InstanceMethods)
		base.class_eval do
			class << self
				alias_method_chain :inherited, :simply_sessions_before_filter
			end
		end
	end

module ClassMethods

private

	def inherited_with_simply_sessions_before_filter(base)
		identifier = 'inherited_simply_sessions_login_required'
		unless filter_chain.select(&:before?).map(&:identifier
			).include?(identifier)
			before_filter :login_required,
				:identifier => identifier
		end
		inherited_without_simply_sessions_before_filter(base)
	end

end

module InstanceMethods

	def logged_in?
		!current_user.nil?
	end

	def current_user_required
		unless logged_in?
			access_denied("goodbye","/some_fake_login_path")
		end
	end
	alias_method :login_required, :current_user_required

	def current_user
		@current_user ||= if( session && session[:uid] )
				#	if the user model hasn't been loaded yet
				#	this will return nil and fail.
				User.find_by_uid(session[:uid])
			else
				nil
			end
	end

end	#	InstanceMethods

end	#	SimplySessions::Controller
ActionController::Base.send(:include,SimplySessions::Controller)
