class V1::Api::MenuController < ActionController::API

  def by_status
    menu_top = Position.where(parent_id: nil)
    menu = MenuBuilder.new.perform(menu_top, params[:kind])

    render({json: {result:  menu.as_json}})
  end
end
