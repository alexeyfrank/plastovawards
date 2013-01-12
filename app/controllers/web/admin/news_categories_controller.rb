class Web::Admin::NewsCategoriesController < Web::Admin::ApplicationController
  def index
    @categories = NewsCategory.all
  end

  def new
    @category = NewsCategory.new
  end

  def create
    @category = NewsCategory.new params[:news_category]
    if @category.save
      flash[:notice] = "Successfully created"
      redirect_to admin_news_categories_path
    else
      flash[:error] = "Got some errors!"
      render :new
    end
  end

  def edit
    @category = NewsCategory.find params[:id]
  end

  def update
    @category = NewsCategory.find params[:id]
    if @category.update_attributes params[:news_category]
      flash[:notice] = "Successfully updated"
      redirect_to admin_news_categories_path
    else
      flash[:error] = "Got some errors!"
      render :edit  
    end
  end

  def destroy
    @category = NewsCategory.find params[:id]
    @category.delete
    flash[:notice] = "News category successfully destroyed!"
    redirect_to admin_news_categories_path
  end
end
