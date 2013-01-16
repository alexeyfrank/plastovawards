CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJYB3N2H4IATG2KWQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    # :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    #         :hosts                  => 's3.example.com',             # optional, defaults to nil
    #         :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'plastovawards'                     # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end