Orvabud::Application.configure do
  settings = YAML.load(File.read("#{Rails.root}/config/mailer.yml"))[Rails.env]
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = settings
end