module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	# This is based on the unique email.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		# gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		# Defining optional size parameter
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

end
