class Admin::PagesController < Admin::AdminController

  create.wants.html {redirect_to(admin_pages_path)}
  update.wants.html {redirect_to(admin_pages_path)}
  destroy.wants.html {redirect_to(admin_pages_path)}

  index.response do |format|
    format.html
    format.js { render :layout => false }
  end

  include Order
  
  protected
  def collection
    @collection = Page.find(params[:parent_id]).pages
    rescue
    @collection = Page.main_pages
  end
end
