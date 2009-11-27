class Admin::ProceduresController < Admin::AdminController
  
  cache_sweeper :procedure_sweeper
  create.wants.html {redirect_to(collection_url)}
  update.wants.html {redirect_to(collection_url)}
  
  include Order
end
