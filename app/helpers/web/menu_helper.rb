module Web::MenuHelper
  def render_menu(params)
    # @items = MenuItem.where(menu_id: params[:id]).includes(:translations).order(:position).roots.all
    @items = MenuItem.to_tree params[:id]
    render params[:template] #, menu: @menu
  end
end