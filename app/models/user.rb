class User < ActiveRecord::Base

	include UserAuthentication

	# Associations
	has_many :pins
end
