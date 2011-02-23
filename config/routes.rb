ActionController::Routing::Routes.draw do |map|

	map.logout 'logout', :controller => 'sessions', :action => 'destroy'
	map.resource :session, :only => [ :destroy ]

end
