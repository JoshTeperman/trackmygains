module LayoutHelper
  def page_title
    app_title = 'Undo'
    prefix = content_for?(:page_title) ? "#{content_for(:page_title)} | " : ''
    content_tag(:title, prefix.concat(app_title))
  end
end
