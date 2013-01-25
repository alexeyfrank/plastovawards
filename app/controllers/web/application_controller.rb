class Web::ApplicationController < ApplicationController
  include Web::AuthHelper
  include Web::LocalizationHelper
  include Web::ScaffoldHelper
  include Web::SettingsHelper
  
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  def layout_title 
    return l_layout_title(@page.title) if @page.present?
    return l_layout_title(@layout_title) if @layout_title.present?
    return l_layout_title('')
  end

  helper_method :current_user, :signed_in?, :layout_title
  
  private
    def header_img(type)
      begin
        @header_img = {
          src: I18n.t!("layouts.headers.#{type}.src"),
          width: I18n.t!("layouts.headers.#{type}.width"),
          height: I18n.t!("layouts.headers.#{type}.height"),
          body_class: I18n.t!("layouts.headers.#{type}.body_class"),
        }
      rescue I18n::MissingTranslationData
        @header_img = {
          src: I18n.t!("layouts.headers.default.src"),
          width: I18n.t!("layouts.headers.default.width"),
          body_class: I18n.t!("layouts.headers.default.body_class"),
        }
      end
    end
end
