class IndexService
  attr_accessor :scope, :params

  def initialize(scope, params)
    @scope = scope
    @params = params
  end

  def index
    @scope
  end
end

