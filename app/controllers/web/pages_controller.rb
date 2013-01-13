class Web::PagesController < Web::ApplicationController
  def index
    @page = Page.home_page.first
    @pictures_group = MemberPicture.limit(14).order("created_at DESC").all
    @pictures_group1, @pictures_group2 = @pictures_group.in_groups_of(7)
    
    header_img :default
  end

  def show
    @page = Page.find_by_slug! params[:slug]
    header_img params[:slug]
  end

end
