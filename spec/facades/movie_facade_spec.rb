require 'rails_helper'

RSpec.describe MovieFacade do

  context ' class methods' do
    it 'one_movie(movie_id)', :vcr do
      movie_id = 76341
      movie = MovieFacade.one_movie(movie_id)

      expect(movie.class).to eq(Movie)
    end
  end
end
