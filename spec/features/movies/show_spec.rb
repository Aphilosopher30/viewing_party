require 'rails_helper'

RSpec.describe 'movies show page' do
  before :each do
    visit movie_path(76341)
  end

  context 'the page has details about the movie' do
    it 'has movie title, vote average, runtime, genre, and summary description', :vcr do
      summary_description = "An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order."
      
      expect(page).to have_content('Mad Max: Fury Road')

      within '#details' do
        expect(page).to have_content(7.5)
        expect(page).to have_content('2 hrs 1 min')
        expect(page).to have_content('Action, Adventure, Science Fiction')
        expect(page).to have_content(summary_description)
      end
    end

    it 'has only first 10 cast members', :vcr do
      characters = ['Tom Hardy as Max Rockatansky',
        'Charlize Theron as Imperator Furiosa',
        'Nicholas Hoult as Nux',
        'Hugh Keays-Byrne as Immortan Joe',
        'Josh Helman as Slit',
        'Nathan Jones as Rictus Erectus',
        'Zoë Kravitz as Toast the Knowing',
        'Rosie Huntington-Whiteley as The Splendid Angharad',
        'Riley Keough as Capable',
        'Abbey Lee as The Dag']

      within '#cast' do
        characters.each do |char|
          expect(page).to have_content(char)
        end
        expect(page).to_not have_content('Courtney Eaton as Cheedo the Fragile')
      end
    end
  end

  context 'you want to know what other users think about the movie' do
    it 'has all the user reviews for the movie', :vcr do
      expect(page).to have_content('11 Reviews')

      within '#reviews' do
        expect(page).to have_content('Phileas Fogg')
        expect(page).to have_content('John Chard')

        expect(page).to have_content('Author:', count: 11)
      end
    end
  end

  context 'you want to host a party for this movie', :vcr do
    it 'there is a button to create a new party' do
      expect(page).to have_button('Create ViewingParty for Movie!')
    end

    it 'the new party button takes you to the new party page' do
      click_on 'Create ViewingParty for Movie!'

      expect(current_path).to eq(new_party_path)
    end
  end
end