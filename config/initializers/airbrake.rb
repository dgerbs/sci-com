Airbrake.configure do |config|
  if Rails.env.production?
    config.api_key = ENV['AIRBRAKE_API_KEY']
config.ignore_only = []
  end
end
