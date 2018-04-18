Apipie.configure do |config|
  config.app_name                = "BlogApi"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apidoc"
  config.translate = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
