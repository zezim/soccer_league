require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a signup page at 'new_user_registration_path'" do
    get "/users/sign_up"
  	response.should have_selector('h2', :content => "Sign up")
  end
  
  it "should have the right links on the layout" do
	visit root_path
	click_link "About"
	response.should have_selector('title', :content => "About")
	click_link "Help"
	response.should have_selector('title', :content => "Help")
	click_link "Contact"
	response.should have_selector('title', :content => "Contact")
	click_link "Home"
	response.should have_selector('title', :content => "Home")
	click_link "Sign In"
	response.should have_selector('h2', :content => "Sign in")
	click_link "People"
	response.should have_selector('title', :content => "Person Repository")
	click_link "Teams"
	response.should have_selector('title', :content => "Team Repository")
	click_link "Leagues"
	response.should have_selector('title', :content => "League Management")
  end
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => new_user_session_path,
                                          :content => "Sign In")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "user_username",   :with => @user.username
      fill_in "user_password",  :with => @user.password
      click_button
    end
    
    it "should have a signout link" do
      visit root_path
      response.should have_selector("a",:href => "/users/sign_out",
                                          :content => "Sign out") 
    end
  
    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => edit_user_registration_path, 
                                        :content => "Profile")
    end
  end
end