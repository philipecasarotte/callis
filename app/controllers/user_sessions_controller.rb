class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = I18n.t(:login_message)
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = I18n.t(:logout_message)
    redirect_back_or_default root_path
  end
  
  def check_status
    unless current_user
      redirect_to login_path
    else
      redirect_to logout_path
    end
  end
end
