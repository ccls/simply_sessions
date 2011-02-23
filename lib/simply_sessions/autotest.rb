class Autotest::Rails

#
#	Need both the mapping and the extra files
#
	def run_with_simply_sessions
		add_exception %r%config/%
		add_exception %r%versions/%
		add_exception %r%\.git/%
		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/simply_sessions/'))

		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/simply_sessions/'))

		add_mapping( 
			%r{^#{File.expand_path(File.join(File.dirname(__FILE__),'/../../test/'))}/(unit|functional)/simply_sessions/.*_test\.rb$}
			) do |filename, _|
			filename
		end
		run_without_simply_sessions
	end
	alias_method_chain :run, :simply_sessions


end
