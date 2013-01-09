class Web::PagesController < Web::ApplicationController
  def index
    @page = Page.home_page.first
    header_img :default
  end

  def show
    @page = Page.find_by_slug! params[:slug]
    header_img params[:slug]
  end

end
