dropbox_key = ENV["DROPBOX_KEY"]
dropbox_secret = ENV["DROPBOX_SECRET"]

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :dropbox, dropbox_key, dropbox_secret
end
Dropbox::API::Config.app_key    = dropbox_key
Dropbox::API::Config.app_secret = dropbox_secret