class MovieFacade
  def self.one_movie(movie_id)
    movie_info = FilmService.get_movie_info(movie_id)
    Movie.new(movie_info)
  end

  def self.ten_actors(movie_id)
    actors = FilmService.credits(movie_id)[:cast][0..9]
    actors.map { |actor| Actor.new(actor) }
  end

  def self.reviews(movie_id)
    reviews = FilmService.get_movie_reviews(movie_id)[:results]
    reviews.map { |review| Review.new(review) }
  end
end
