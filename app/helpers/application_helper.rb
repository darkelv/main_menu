module ApplicationHelper
  def position_color(position)
    case position.kind
      when 'new'
        '#ADFF2F'
      when 'active'
        '#FFFFFF'
      when 'blocked'
        '#FF0000'
    end
  end
end
