class UsersController < ApplicationController
  
  before_filter :require_user
  
  #after_filter(:except => :index) {|c| c.cache_page}
  
  def index
    if params[:mes]
      @users = User.all(:conditions => "MONTH(birthday) = #{params[:mes]}")
    else
      @users = User.all
    end
    get_page
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def get_page
    @page = Page.find_by_permalink("aniversariantes")
    @metatag_object = @page
  end
end
