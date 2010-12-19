module ApplicationHelper

  def logo
#	base_logo = image_tag("logo.png", :alt => "Soccer_League", :class => "round") 
	base_logo = image_tag("soccer_icon.png", :alt => "Soccer_League", :class => "top_logo") 
	#if @logo.nil?
	#	base_logo
	#end


  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :class => css_class
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Soccer_League Manager"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
