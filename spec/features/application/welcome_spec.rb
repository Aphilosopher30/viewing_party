require 'rails_helper'

RSpec.describe 'welcome page' do
  before :each do
    visit root_path
  end

  context "you go to main page" do
    it "has welcome message", :logged_out do
      expect(page).to have_content("Welcome to ViewingParty")
    end

    it "has application discription", :logged_out do
      expect(page).to have_content("The app for planning movie parties with your friends!")
    end

    context "you arrive at page for first time", :logged_out do
      it "has link to register a new user" do
        click_on "Register new user"
        expect(current_path).to eq(register_path)
      end

      it "has link for existing user to login" do
        click_on "Login"
        expect(current_path).to eq(login_path)
      end
    end
  end

  context "when you are already logged in" do
    before :each do
      @user = create(:user)
    end
    
    it "has no login and no register link" do
      expect(current_path).to eq(dashboards_path)
    end

    it "has a log out link" do
      expect(page).to have_link("Logout")
    end

    it "logout link works", :logged_out do
      visit login_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on 'Login'
      
      click_on "Logout"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You have successfully logged off.")
    end
  end
end
