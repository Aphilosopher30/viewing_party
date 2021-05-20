class MovieFacade



  def self.one_movie(one_movie_info)
    response = FilmService.get_movie_info(one_movie_info)
    Movie.new(response)
  end


end
