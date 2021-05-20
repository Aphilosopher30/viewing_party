require 'rails_helper'

RSpec.describe 'user registration page' do
  context "you go to register a new account" do
    before :each do
      visit register_path
    end

    it "has link to register a new user" do
      fill_in "user[email]", with: "555@dooffus.edu"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      fill_in "user[name]", with: "The Doof"
      click_on("Register")

      expect(current_path).to eq(dashboards_path)
    end

    it "requires valid input" do
      fill_in "user[email]", with: ""
      fill_in "user[password]", with: ""
      fill_in "user[name]", with: ""
      click_on("Register")

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Email can't be blank, Name can't be blank, Password digest can't be blank, Password confirmation doesn't match Password, Password can't be blank")
    end

    it 'has a link to login if you already have an acct' do
      expect(page).to have_link('Already have an account? Login here!')
      click_on 'Already have an account? Login here!'

      expect(current_path).to eq(login_path)
    end
  end
end
