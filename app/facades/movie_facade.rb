class MovieFacade
  def self.one_movie(movie_id)
    movie_info = FilmService.get_movie_info(movie_id)
    Movie.new(movie_info)
  end

  def self.ten_actors(movie_id)
    actors = FilmService.get_first_10_credits(movie_id)
    actors.map {|actor| Actor.new(actor)}
  end

  def self.reviews(movie_id)
    # binding.pry
    reviews = FilmService.get_movie_reviews(movie_id)
    reviews.map {|review| Review.new(review)}
  end




end
