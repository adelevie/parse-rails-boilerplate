class User < ParseUser
	has_many :authentications
	alias :email :username
	
	fields :settings

	validates :password, :length => { :minimum => 6 }
  validates_confirmation_of :password
  valid_username_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :format => { :with => valid_username_regex ,
  			:message => "should be valid email address" }

	def dropbox_client
		if @dropbox_client
			return @dropbox_client
		else
			auth = Authentication.where(:user => to_pointer).where(:provider => 'dropbox').first
			@dropbox_client = Dropbox::API::Client.new(:token  => auth.token, :secret => auth.secret)
		end
	end
	
	def fetch_documents
	  documents = Document.where(:settings => self.settings)
	  documents.each do |document|
	    self.upload(document.name, document.file) unless self.has_document?(document)
	  end
  end
end