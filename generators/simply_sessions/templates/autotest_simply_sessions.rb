#	From `script/generate simply_sessions` ...
unless Gem.source_index.find_name('ccls-simply_sessions').empty?
	gem 'ccls-simply_sessions'
	require 'simply_sessions/autotest'
end
