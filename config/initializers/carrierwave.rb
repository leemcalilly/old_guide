CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIEU6H43OR6IK2F4A',
    :aws_secret_access_key  => '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'
  }  
  
  if Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
  
  if Rails.env.development?
    config.fog_directory  = 'fuzzguide-dev'
  elsif Rails.env.production?
    config.fog_directory  = 'fuzzguide-prod'
  end    
end