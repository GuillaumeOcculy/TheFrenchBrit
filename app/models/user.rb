class User < ActiveRecord::Base

	include UserAuthentication

	# FriendlyId
	extend FriendlyId
  friendly_id :fullname, use: :slugged

	# Associations
	has_many :castings

	def fullname
		[:firstname, :lastname]
	end
end
