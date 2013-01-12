module Web::MenuHelper
  def render_menu(params)
    @items = MenuItem.where(menu_id: params[:id]).order(:position).roots.all
    render params[:template] #, menu: @menu
  end
end