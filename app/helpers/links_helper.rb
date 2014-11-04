module LinksHelper
  def nav_active_link(link_path, html_class = 'active')
  	current_page?(link_path) ? html_class : ''
  end
  def nav_active_controller(controller, html_class = 'active')
  	controller_name == controller ? html_class : ''
  end
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : nil
  
    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end
  def nav_controller_link(link_text, name, link_path, params = {})
    class_name = controller_name == name ? 'active' : nil
  
    content_tag(:li, class: class_name) do
      link_to link_text, link_path, params
    end
  end
end