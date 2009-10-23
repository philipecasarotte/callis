ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.login 'login', :controller => "user_sessions", :action => "new"
    admin.logout 'logout', :controller => "user_sessions", :action => "destroy"
    admin.resource :user_session
    admin.resources :pages, :as => :paginas, :collection=>{ :reorder=>:get, :order=>:post }
    admin.resources :users, :usuarios
    admin.root :controller => 'pages'
  end

  map.pages '/paginas/:action', :controller => 'pages'
  map.resources :pages, :as => :paginas

  map.not_found '/404', :controller => 'pages', :action => '404'
  map.application_error '/500', :controller => 'pages', :action => '500'
  map.unprocessable_entity '/422', :controller => 'pages', :action => '422'
  map.root :controller => 'pages', :action => 'index'
end

