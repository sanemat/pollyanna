Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity
end
OmniAuth.config.logger = Rails.logger
