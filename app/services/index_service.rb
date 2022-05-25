class IndexService
  attr_accessor :scope, :filter

  def initialize(scope, filter)
    @scope = scope
    @filter = filter || {}
  end

  def index
    parent_name_filter(@scope)
    name_filter(@scope)
    kind_filter(scope)

    @scope
  end

  def parent_name_filter(scope)
    return unless filter[:parent_name].present?

    @scope = scope.joins(:parent).where("parents_positions.name ilike ?", "%#{filter[:parent_name]}%")
  end

  def name_filter(scope)
    return unless filter[:name].present?

    @scope = scope.where("positions.name ilike ?", "%#{filter[:name]}%")
  end

  def kind_filter(scope)
    return unless filter[:kind].present?

    @scope = scope.where("positions.kind = ?", filter[:kind])
  end
end
