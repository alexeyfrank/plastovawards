class Web::Admin::SettingsController < Web::Admin::ApplicationController
  # include Web::SettingsHelper
  
  def new
    @settings = Settings.all
  end

  def create 
    store_settings :site_name
    store_settings :phone
    store_settings :email
    store_settings :vkontakte_url
    store_settings :facebook_url
    store_settings :twitter_url
    store_settings :show_main_page_gallery
    # store_settings :logo
    # store_settings :header_image
    # store_settings :emergency_call
    # store_settings :emergency_call_enabled

    flash[:notice] = "Settings was successfully updated"
    redirect_to new_admin_setting_path
  end
  
  private
    def store_settings(key)
      store key, params[:settings][key]
    end
end
