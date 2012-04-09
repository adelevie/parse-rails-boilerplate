class User < ParseUser
	alias :email :username
end