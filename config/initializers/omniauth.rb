Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :identity, on_failed_registration: lambda { |env|    
    IdentitiesController.action(:new).call(env)}
end

# OmniAuth.config.on_failure  = -> env do
#   env[ActionDispatch::Flash::KEY] ||= ActionDispatch::Flash::FlashHash.new
#   env[ActionDispatch::Flash::KEY][:error] = "Either your email or password was not recognised. Please try again." 
#   SessionsController.action(:create).call(env) #call whatever controller/action that displays your signup form
# end

