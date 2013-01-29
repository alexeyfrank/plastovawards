class Web::PagesController < Web::ApplicationController
  def index
    @page = Page.home_page.first
    if settings[:show_main_page_gallery] && settings[:show_main_page_gallery] == 'yes'
      @pictures_group = MemberPicture.where('member.state' => [:published, :winner, :in_short_list]).limit(14).order("created_at ASC").all
      @pictures_group1, @pictures_group2 = @pictures_group.in_groups_of(7)
    end
    header_img :default
  end

  def show
    @page = Page.find_by_slug! params[:slug]
    header_img params[:slug]
  end

end
