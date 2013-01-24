module Web::SettingsHelper
  
  def settings
    @settings ||= Settings.all
    # return Settings.all if key.nil?
    # return Settings[key] if value.nil?
    # store key, value
  end

  private
    def store(key, value)
      return false if value.blank?
      p value
      if value.is_a? ActionDispatch::Http::UploadedFile
        store_file key, value
      else
        store_string key, value
      end
    end

    def store_string(key, value)
      Settings[key] = value
    end
    
    def store_file(key, value)
      if value
        uploader = SettingsUploader.new
        uploader.store! value
        Settings[key] = uploader.store_path
      end
    end
end