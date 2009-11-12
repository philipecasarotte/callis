class ProceduresController < ApplicationController
  
  before_filter :require_user
  
  after_filter(:except => [:search, :index]) {|c| c.cache_page}
  
  def index
    @procedures = Procedure.by_position
    get_page
  end
  
	def search
	 query = "%#{params[:q].strip}%" if params[:q]
   @procedures = Procedure.all :include => {:user, :department}, :conditions => ["`procedures`.name LIKE ? OR explanation LIKE ? OR steps LIKE ? OR warning LIKE ? OR place LIKE ? OR `users`.name LIKE ? OR `departments`.name LIKE ?", query, query, query, query, query, query, query]
   get_page
	end
  
  def show
    @procedure = Procedure.find_by_permalink(params[:id])
    @metatag_object = @procedure
  end
  
  def get_page
     @page = Page.find_by_permalink("procedimentos")
     @metatag_object = @page
  end
end
