Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_CLIENT_ID', nil), ENV.fetch('GOOGLE_CLIENT_SECRET', nil),
           {
             scope: 'email, profile, http://gdata.youtube.com',
             prompt: 'select_account',
             image_aspect_ratio: 'square',
             image_size: 50
           }
end

OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.silence_get_warning = true
