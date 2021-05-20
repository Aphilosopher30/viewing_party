class MoviesController < ApplicationController
  def index
    @title = to_uri(params[:title]) if params[:title] && params[:title].present?

    @service = if @title
                 FilmService.movie_search(@title)
               else
                 FilmService.top_movies
               end
  end

  def show
    @movie_id = params[:id]
    @movie = FilmService.get_movie_info(@movie_id)
    @cast = FilmService.get_first_10_credits(@movie_id)
    @reviews = FilmService.get_movie_reviews(@movie_id)
  end

  def discover; end
end
