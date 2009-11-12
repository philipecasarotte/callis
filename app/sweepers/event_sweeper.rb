class EventSweeper < ApplicationSweeper
  observe :event
  has_permalink

  def after_clear_cache(model)
      expire_page('/index')
      expire_page('/eventos/arquivo')
      sweep_directory(index_model_path(model), "/", "system", "images", "javascripts")
  end

end