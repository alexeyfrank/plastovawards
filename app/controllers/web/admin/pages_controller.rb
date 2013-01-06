class Web::Admin::PagesController < Web::Admin::ApplicationController
  def index
    @pages = Page.all #page(params[:page]).per(configus.admin_entities_per_page)
  end

  def new
    @page = Page.new
  end

  def create
    if current_user.pages.create params[:page]
      flash[:notice] = "Page was successfully created"
    end
    redirect_to admin_pages_path
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
    @page = Page.find params[:id]
    if @page.update_attributes params[:page]
      flash[:notice] = "Page was successfully created"
    end
    render :edit
  end

  def destroy
    @page = Page.find params[:id]
    @page.delete
    redirect_to admin_pages_path
  end
end
