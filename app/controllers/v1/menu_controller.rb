class V1::MenuController < ApplicationController
  layout 'application'

  def index
    menu_top = Position.where(parent_id: nil)
    menu = MenuBuilder.new.perform(menu_top)
    render locals: {menu: menu}
  end
end
