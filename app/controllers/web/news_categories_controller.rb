class Web::NewsCategoriesController < Web::ApplicationController
  def show
    header_img :news
    @category = NewsCategory.includes(:news).where(id: params[:id]).published.first
    @layout_title = @category.title 
  end
end
