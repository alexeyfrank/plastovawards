class Web::Admin::MenuItemsController < Web::Admin::ApplicationController
  layout false, only: [:new, :edit]

  def index
    @menu = Menu.find params[:menu_id]
    @items = @menu.menu_items.order(:position).roots
  end

  def new
    @items = MenuItem.where menu_id: params[:menu_id]
    @item = MenuItem.new menu_id: params[:menu_id]
  end

  def create
    @menu = Menu.find params[:menu_id]
    @menu_item = MenuItem.new params[:menu_item]
    @menu_item.menu = @menu
    if @menu_item.save
      flash[:notice] = "Menu Item successfully created"
    else
      flash[:error] = "Menu Item has errors"
    end
    redirect_to admin_menu_menu_items_path(@menu.id)
  end

  def edit
    @items = MenuItem.where menu_id: params[:menu_id]
    @item = MenuItem.find params[:id]
  end

  def update
    @item = MenuItem.find params[:id]
    if @item.update_attributes params[:menu_item]
      flash[:notice] = "Menu Item successfully created"
    else
      flash[:error] = "Menu Item has errors"
    end
    redirect_to admin_menu_menu_items_path(@item.menu_id)
  end

  def destroy
    @item = MenuItem.find params[:id]
    @item.destroy
    redirect_to admin_menu_menu_items_path
  end
end
