class Admin::PositionsController < ApplicationController
  layout 'admin'

  def index
    positions = ::IndexService.new(Position.includes(:parent, :child_positions), filter_params).index
    positions = positions.order(created_at: :desc).page(params[:page]).per(10)
    render locals: {positions: positions}
  end

  def move_to_next_status
    result = current_position.move_to_next_status(params[:kind])
    notice = result ? 'Успешно' : 'Неверный начальный статус'
    redirect_to admin_positions_path, notice: notice
  end

  def current_position
    Position.find(params[:id])
  end

  def filter_params

  end
end
