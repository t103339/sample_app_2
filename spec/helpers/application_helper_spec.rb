require 'spec_helper'

#include ActionDispatch::TestProcess
require 'action_dispatch/testing/test_process'

describe ApplicationHelper do

	it "should include the page title" do
		full_title('foo').should =~ /foo/
	end

	it "should include the base title" do
		full_title('foo').should =~ /^Ruby on Rails Tutorial Sample App/
	end

	it "should not include a bar on the home page" do
		full_title('').should_not =~ /\|/
	end
	
end