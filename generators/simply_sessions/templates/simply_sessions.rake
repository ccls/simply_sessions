# From `script/generate simply_sessions` ...
# condition added to allow clean 'rake gems:install'
unless Gem.source_index.find_name('ccls-simply_sessions').empty?
	gem 'ccls-simply_sessions'
	require 'simply_sessions/test_tasks'
end
