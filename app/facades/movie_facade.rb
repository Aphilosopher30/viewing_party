class MovieFacade
  def self.one_movie(movie_id)
    movie_info = FilmService.get_movie_info(movie_id)
    Movie.new(movie_info)
  end
end
