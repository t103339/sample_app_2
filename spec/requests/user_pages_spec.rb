require 'spec_helper'

describe "UserPages" do

	subject {page}

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user)}
		before { visit user_path(user) }
		it { should have_selector( 'h1',    text: user.name)}
		it { should have_selector( 'title', text: user.name)}
	end

	describe "signup page" do
		#before { visit signup_path }
		before { visit new_user_path }
		it { should have_selector( 'h1',    text: 'Sign up')}
		it { should have_selector( 'title', text: full_title('Sign up'))}
	end

	describe "signup page functionality" do

		before {visit new_user_path}
		#before {visit signup_path}

		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with invalid information should display error messages" do
			before { click_button submit }
			it { should have_selector('#error_explanation', 
				                        text: "Password can't be blank") }
			it { should have_selector('#error_explanation', 
				                        text: "Password confirmation can't be blank") }
			it { should have_selector('#error_explanation', 
				                        text: "Password is too short") }
			it { should have_selector('#error_explanation', 
				                        text: "Name can't be blank") }
			it { should have_selector('#error_explanation', 
				                        text: "Email can't be blank") }
			it { should have_selector('#error_explanation', 
				                        text: "Email is invalid") }
		end

		describe "with valid information" do

			let (:testemail) {"user@example.com"}
			let (:avatar) {"app/assets/images/myrails.png"}

			before do
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: testemail
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving a user successfully, should go to profile page" do

				before { click_button submit }

				let(:user) { User.find_by_email(testemail) }

				it { should have_selector('title', text: user.name) }

				# testing for file uploads (demo code only)

				# it "can upload a license" do
				#   visit upload_license_path
				#   attach_file "uploadLicense", /path/to/file/to/upload
				#   click_button "Upload License"
				# end

				# it "can download an uploaded license" do
				#   visit license_path
				#   click_link "Download Uploaded License"
				#   page.should have_content("Uploaded License")
				# end
				
			end
			
		end
		
	end

end
