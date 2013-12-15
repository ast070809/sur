require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "landing page" do 
		before { visit root_path }
		it { should have_title('Home')}
		
		describe "login button " do
			before { click_link "Login"}

			it { should have_title('Sign up')}
		end
	end

end