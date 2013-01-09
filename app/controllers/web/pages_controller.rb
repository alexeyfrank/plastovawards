class Web::PagesController < Web::ApplicationController
  def index
    @page = Page.home_page.first
    header_img :default
  end

  def show
    @page = Page.find_by_slug! params[:slug]
    header_img :slug
  end
  
  private
    def header_img(type)
      begin
        @header_img = {
          src: I18n.t("layouts.headers.#{type}.src"),
          width: I18n.t("layouts.headers.#{type}.width"),
          height: I18n.t("layouts.headers.#{type}.height"),
        }
      rescue I18n::MissingTranslationData
        header_img :default
      end
    end
end
