CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIJ6HFR3QTBXQJLYQ',
    :aws_secret_access_key  => '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'
  }  
  
  if Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
  
  if Rails.env.development?
    config.fog_directory  = 'fuzzguide-development'
  elsif Rails.env.production?
    config.fog_directory  = 'fuzzguide-production'
  end    
end