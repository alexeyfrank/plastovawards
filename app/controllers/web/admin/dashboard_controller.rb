class Web::Admin::DashboardController < Web::Admin::ApplicationController
  def index
    @news = News.limit(5)
    @pages = News.limit(5)
    @members = News.limit(5)
  end
  
  def new
  end
end
