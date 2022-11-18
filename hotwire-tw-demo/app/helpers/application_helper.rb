module ApplicationHelper
  def active_css_class(active_path)
    current_page?(active_path, check_parameters: true) ? 'active' : 'link-dark'
  end
end
