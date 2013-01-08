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
end
