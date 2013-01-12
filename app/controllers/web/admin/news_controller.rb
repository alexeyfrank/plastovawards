class Web::Admin::NewsController < Web::Admin::ApplicationController
  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    if current_user.news.create params[:news]
      flash[:notice] = "Successfully created"
      redirect_to admin_news_index_path
    else
      flash[:error] = "Got some errors"
      render :new
    end
  end

  def edit
    @news = News.find params[:id]
  end

  def update
    @news = News.find params[:id]
    if @news.update_attributes params[:news]
      flash[:notice] = "Successfully updated"
      redirect_to admin_news_index_path
    else
      flash[:error] = "Got some errors"
      render edit
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.delete 
    flash[:notice] = "News has successfully destroyed"
  end
end
