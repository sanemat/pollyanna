Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity,
    on_login: ->(env) { SessionsController.action(:new).call(env) },
    on_registration: ->(env) { IdentitiesController.action(:new).call(env) }
end
OmniAuth.config.logger = Rails.logger
