class Web::PagesController < Web::ApplicationController
  def index
    @page = Page.home_page.first
  end

  def show
    @page = Page.find_by_slug! params[:slug]
  end
end
