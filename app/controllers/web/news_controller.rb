class Web::NewsController < Web::ApplicationController
  def show
    header_img :news
    @news = News.find params[:id]
  end
end
