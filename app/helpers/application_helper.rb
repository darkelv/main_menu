module ApplicationHelper
  def position_color(position)
    case position.kind
      when 'new'
        '#FFFF00'
      when 'active'
        '#198754'
      when 'blocked'
        '#FF0000'
    end
  end

  def menu_title(item)
    content_tag(:div, style: "background-color:#{position_color(item[:parent])}") do
      item[:parent].name + menu_count(item)
    end
  end

  def menu_count(item)
    " #{item[:count]}"
  end

  def menu_children(item)
    if item[:children].any?
      content_tag :ul do
        item[:children].map do |children|
          content_tag(:li, style: "background-color:#{position_color(children[:parent])}") do
            show_menu([children])
          end
        end.compact.join('').html_safe
      end
    end
  end

  def show_menu(menu)
    menu.map do |item|
      menu_title(item) + menu_children(item).to_s
    end.join('').html_safe
  end
end
