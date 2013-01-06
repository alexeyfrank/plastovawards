class Web::Admin::MenusController < Web::Admin::ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find params[:id]
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new params[:menu]
    if @menu.save
      flash[:notice] = "Menu successfully created"
      redirect_to admin_menu_path(@menu)
    else
      render :new
    end
  end

  def edit
    @menu = Menu.find params[:id]
  end

  def update
    @menu = Menu.find params[:id]
    if @menu.update_attributes params[:menu]
      flash[:notice] = "Menu successfully updated"
      redirect_to admin_menu_path(@menu)
    else
       render :edit
    end
  end

  def destroy
    @menu = Menu.find params[:id]
    @menu.delete
    redirect_to admin_menus_path
  end
end
