class MenuBuilder
  def perform(items, kind = nil)
    items = items.where(kind: kind) if Position.aasm.events.map(&:name).include?(kind&.to_sym)
    items.map{|item| { parent: item, children: perform(item.child_positions, kind), count: item.child_positions.count  } }
  end
end
