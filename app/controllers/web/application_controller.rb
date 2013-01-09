class Web::ApplicationController < ApplicationController
  include Web::AuthHelper
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  helper_method :current_user, :signed_in?
  
  private
    def header_img(type)
      begin
        @header_img = {
          src: I18n.t!("layouts.headers.#{type}.src"),
          width: I18n.t!("layouts.headers.#{type}.width"),
          height: I18n.t!("layouts.headers.#{type}.height"),
        }
      rescue I18n::MissingTranslationData
        @header_img = {
          src: I18n.t!("layouts.headers.default.src"),
          width: I18n.t!("layouts.headers.default.width"),
          height: I18n.t!("layouts.headers.default.height"),
        }
      end
    end
end
