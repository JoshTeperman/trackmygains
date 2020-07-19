module ApplicationHelper
  def render_svg(name, options = {})
    size_classes = {
      'xsmall': '2rem * 2rem',
      'small': '3rem * 3rem',
      'medium': '6rem * 6rem',
      'large': '8rem * 8rem'
    }

    options[:title] = name.underscore.humanize
    options[:class] = options.fetch(:class, 'fill-current text-green-900')
    options[:aria] = true
    options[:nocomment] = true
    options[:size] = size_classes[options.fetch(:size, 'small').to_sym]

    file_name = "#{name}.svg"

    inline_svg_tag(file_name, options)
  end
end
