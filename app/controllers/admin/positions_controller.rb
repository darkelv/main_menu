class Admin::PositionsController < ApplicationController
  layout 'admin'

  def index
    q = Position.includes(:parent, :child_positions).ransack(params[:q])
    positions = q.result.order(created_at: :desc).page(params[:page]).per(10)
    render locals: {positions: positions, q: q}
  end

  def move_to_next_status
    result = current_position.send("may_#{params[:kind]}?") ? current_position.send("#{params[:kind]}!") : false
    notice = result ? 'Успешно' : 'Неверный начальный статус'
    redirect_to admin_positions_path, notice: notice
  end

  def current_position
    Position.find(params[:id])
  end
end
