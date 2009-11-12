class Admin::EventsController < Admin::AdminController
  cache_sweeper :event_sweeper
  create.wants.html {redirect_to(collection_url)}
  update.wants.html {redirect_to(collection_url)}
end
