class String
  def summary(size=200)
    ApplicationController.helpers.truncate(ApplicationController.helpers.strip_tags(self).strip, size)
  end
end