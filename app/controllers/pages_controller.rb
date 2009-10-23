class PagesController < ApplicationController

  after_filter(:except => :contact) {|c| c.cache_page}

  def index
    @pages = Page.main_pages
  end

  def contato
    @page = Page.find_by_permalink('contato')
    if request.post?
      Mailer.deliver_contact(params[:contact])
      flash[:notice] = "Sua mensagem foi enviada." # somehow the specs don't pass using t(:message_sent)
    end
    @metatag_object = @page
  end

  def method_missing(method, *args)
    @page = Page.find_by_permalink(method) || @page = Page.page_not_found
    @pages = @page.pages || []
    @metatag_object = @page
    send(method.underscore) if respond_to?(method.underscore)

    render method.underscore
    rescue ActionView::MissingTemplate
      render 'show'
  end

end

