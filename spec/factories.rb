FactoryGirl.define do

	# include ActionDispatch::TestProcess

	# factory :user do
	# 	#avatar File.join(Rails.root, 'app', 'assets', 'images', 'rails.png')
	# 	name "Michael Hartl"
	# 	email "michael@example.com"
	# 	password "foobar"
	# 	password_confirmation "foobar"
	# 	avatar fixture_file_upload('/files/rails.png', 'image/png')
	# end

	factory :user do
		name "Michael Hartl"
		email "michael@example.com"
		password "foobar"
		password_confirmation "foobar"
		#avatar fixture_file_upload('rails.png', 'image/png')
		avatar_file_name File.join(Rails.root, 'app', 'assets', 'images', 'rails.png')
		# avatar_file_name 
		avatar_content_type "image/jpeg"
		# avatar_file_size
	end

end