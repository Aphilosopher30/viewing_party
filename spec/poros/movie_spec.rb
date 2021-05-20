require 'rails_helper'

RSpec.describe Movie do

  context 'the movie object ' do
    it 'exits' do
      info = {id: 1, title: 'new movie', runtime: 121, genres: ['action', 'advanture'], overview: "it's a film"}
      movie = Movie.new(info)

      expect(movie.class).to eq(Movie)
    end

    it 'has attributes' do
      info = {id: 1, title: 'new movie', runtime: 121, genres: ['action', 'advanture'], overview: "it's a film"}
      movie = Movie.new(info)

      expect(movie.id).to eq(1)
      expect(movie.title).to eq('new movie')
      expect(movie.genres).to eq(['action', 'advanture'])
      expect(movie.runtime).to eq(121)
      expect(movie.overview).to eq("it's a film")

    end
  end


end
