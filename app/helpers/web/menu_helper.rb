module Web::MenuHelper
  def render_menu(params)
    @items = MenuItem.where(menu_id: params[:id]).order(:position).roots
    render params[:template] #, menu: @menu
  end
end