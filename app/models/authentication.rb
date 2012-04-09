class Authentication < ParseResource::Base
	belongs_to :user
	fields :provider, :token, :secret
end