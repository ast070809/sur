require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "Sign in page" do
  	before { visit signin_path }
  	it { should have_content('Sign in')}
  	it { should have_title('Sign in')}
  end

  describe "signin" do
    before { visit signin_path}
  	

  	describe "with invalid information" do
  		before { click_button "Sign in" }
      it { should have_title('Sign in') }
  	end

  	describe "with valid information" do
  		let(:user) {FactoryGirl.create(:user)}

  		before do
  			fill_in "Email", with: user.email.upcase
  			fill_in "Password", with: user.password
  			click_button "Sign in"
  		end

  		it { should have_link('Sign out', href: signout_path)}
  		it { should_not have_link('Sign in', href: signin_path)}
  		it { should have_link(user.name, href: user_path(user))}
  	end
  end

end
