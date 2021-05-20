class MoviesController < ApplicationController
  def index
    @title = params[:title] if params[:title] && params[:title].present?
    @service = if @title
                 FilmService.movie_search(@title)
               else
                 FilmService.top_movies
               end
  end

  def show
    @movie_id = params[:id]
    @movie = MovieFacade.one_movie(params[:id])

    @cast = MovieFacade.ten_actors(@movie_id)
    @reviews = MovieFacade.reviews(@movie_id)
  end

  def discover; end
end
