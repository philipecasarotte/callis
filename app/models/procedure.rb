class Procedure < ActiveRecord::Base
  after_save :admin_alert
  
  belongs_to :user
  belongs_to :department
  
  validates_presence_of :name, :explanation
  validates_uniqueness_of :permalink
  
  acts_as_seo

  has_permalink :name, :update => true
  
  named_scope :by_date, :order => "created_at DESC"
  named_scope :by_position, :order => "position"
  
  def admin_alert
    Mailer.deliver_admin_alert(current_user, self)
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
