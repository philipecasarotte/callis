class Mailer < ActionMailer::Base
  
  require 'tlsmail'

  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  
  ActionMailer::Base.raise_delivery_errors = true

  ActionMailer::Base.smtp_settings = {
      :tls => true,
      :address => "smtp.gmail.com",
      :port => "587",
      :domain => SITE_DOMAIN,
      :authentication => :plain,
      :user_name => "callisintranet@gmail.com",
      :password => "editora@123"
  }
  
  def contact(params)
    @recipients = 'dev.dburns@gmail.com' 
    #@recipients = SITE_EMAIL
    @from = params[:email] if params[:email]
    @reply_to = params[:email] if params[:email]
    @subject = I18n.t(:contact_from) + " #{SITE_DOMAIN}"
    @sent_on = Time.now
    @content_type = 'text/html'
    
    body[:params] = params
  end
  
  def admin_alert(user, procedure)
    @current_user = user
    @recipients = SITE_EMAIL
    @from = @current_user.email
    @reply_to = @current_user.email
    @subject = "Alteração/Adição de Procedimento na Intranet #{SITE_DOMAIN}"
    @sent_on = Time.now
    @content_type = 'text/html'
    
    body[:procedure] = procedure
    body[:user] = user
  end


end
