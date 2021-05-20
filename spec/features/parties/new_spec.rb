require 'rails_helper'

RSpec.describe 'new viewing party page', :vcr do
  context 'you arrive on the new party page' do
    before :each do
      visit movie_path(76341)
      click_on 'Create ViewingParty for Movie!'
    end

    it 'has the title of the movie' do
      expect(page).to have_content('Mad Max: Fury Road')
    end
  end

  context 'you want to create a new party' do
    before :each do
      user = create(:user)
      friend = create(:user)
      create(:friend, user: user, friend: friend)

      visit root_path
      click_on 'Login'
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'Login'

      visit movie_path(76341)
      click_on 'Create ViewingParty for Movie!'
    end
    
    it 'routes you back to the dashboard', :logged_out do
      fill_in 'party[date]', with: '5/20/2021'
      fill_in 'party[start_time]', with: '07:00 AM'
      click_on :commit
      
      expect(current_path).to eq(dashboards_path)
    end
    
    it 'the new party appears on the dashboard', :logged_out do
      fill_in 'party[date]', with: '2021-05-20'
      fill_in 'party[start_time]', with: '07:00 AM'
      check 'party[guests][]'
      click_on :commit

      within '#hosted_parties' do
        expect(page).to have_link('Mad Max: Fury Road')
        expect(page).to have_content('5/20/21')
        expect(page).to have_content('7:00 AM')
      end
    end
  end
end