require 'active_support'
require 'ruby_extension'
require 'simply_helpful'
require 'simply_authorized'
require 'acts_as_list'
#module SimplySessions
##	predefine namespace
#end

#	This doesn't seem necessary
%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path
end

if defined?(Rails) && Rails.env == 'test' && Rails.class_variable_defined?("@@configuration")
	require 'active_support/test_case'
	require 'factory_girl'
#	require 'simply_pages/factories'
#	else
#		running a rake task
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))

