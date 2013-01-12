class Web::NewsCategoriesController < Web::ApplicationController
  def show
    header_img :news
    @category = NewsCategory.where(id: params[:id]).published.first
  end
end
