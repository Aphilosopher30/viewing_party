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
    @movie = MovieFacade.one_movie(params[:id])
  end

  def discover; end
end
