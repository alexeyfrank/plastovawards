class Web::PagesController < Web::ApplicationController
  def index
  end

  def show
    @page = Page.find_by_slug! params[:slug]
  end
end
