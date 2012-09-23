module ApplicationHelper
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def navigation_links
    links = []
    
    options = params[:controller] == "lists" ? { class: "active" } : {}
    links << content_tag(:li, link_to("My Lists", lists_path), options).html_safe
    
    options = params[:controller] == "public_list" ? { class: "active" } : {}
    links << content_tag(:li, link_to("Public Lists", public_lists_path), options).html_safe

    content_tag(:ul, links.join("\n").html_safe, class: "nav")
  end  
end
