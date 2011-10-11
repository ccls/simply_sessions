require 'active_support'

gem 'ccls-common_lib'
require 'common_lib'

#gem 'ccls-ruby_extension'
#require 'ruby_extension'

gem 'ccls-simply_helpful'
require 'simply_helpful'

gem 'ccls-simply_authorized'
require 'simply_authorized'

require 'acts_as_list'
module SimplySessions
#	predefine namespace
end

#	This doesn't seem necessary
%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path
end

if defined?(Rails) && Rails.env == 'test' && Rails.class_variable_defined?("@@configuration")
	require 'active_support/test_case'
	require 'simply_sessions/test_helper'
	require 'simply_sessions/controller'
	require 'factory_girl'
#	else
#		running a rake task
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))

