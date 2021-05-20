require 'rails_helper'

RSpec.describe MovieFacade do

  context ' class methods' do
    it 'one_movie(movie_id)', :vcr do
      movie_id = 76341
      movie = MovieFacade.one_movie(movie_id)

      expect(movie.class).to eq(Movie)
    end

    it 'ten_actors', :vcr  do
      movie_id = 76341

      actor_1 = Actor.new( {name: "Tom Hardy", character: "Max Rockatansky"})
      actor_2 = Actor.new( {name: "Charlize Theron", character: "Imperator Furiosa"})
      actor_3 = Actor.new( {name: "Nicholas Hoult", character: "Nux"})
      actor_4 = Actor.new( {name: "Hugh Keays-Byrne", character: "Immortan Joe"})
      actor_5 = Actor.new( {name: "Josh Helman", character: "Slit"})
      actor_6 = Actor.new( {name: "Nathan Jones", character: "Rictus Erectus"})
      actor_7 = Actor.new( {name: "Zoë Kravitz", character: "Toast the Knowing"})
      actor_8 = Actor.new( {name: "Rosie Huntington-Whiteley", character: "The Splendid Angharad"})
      actor_9 = Actor.new( {name: "Riley Keough", character: "Capable"})
      actor_10 = Actor.new( {name: "Abbey Lee", character: "The Dag"})

      expected_1 = [actor_1.name, actor_2.name, actor_3.name, actor_4.name, actor_5.name, actor_6.name,  actor_7.name, actor_8.name, actor_9.name, actor_10.name]
      expected_2 = [actor_1.character, actor_2.character, actor_3.character, actor_4.character, actor_5.character, actor_6.character,  actor_7.character, actor_8.character, actor_9.character, actor_10.character]
      expected_3 = [actor_1.class, actor_2.class, actor_3.class, actor_4.class, actor_5.class, actor_6.class,  actor_7.class, actor_8.class, actor_9.class, actor_10.class]

      actors = MovieFacade.ten_actors(movie_id)

      actor_names = actors.map { |actor| actor.name }
      actor_characters = actors.map { |actor| actor.character }
      actor_class = actors.map { |actor| actor.class }

      expect(actor_names).to eq(expected_1)
      expect(actor_characters).to eq(expected_2)
      expect(actor_class).to eq(expected_3)
    end

    it 'reviews', :vcr  do
      movie_id = 76341


      reviews = MovieFacade.reviews(movie_id)

      expected = []

      expect(reviews).to eq(expected)
    end
  end
end
