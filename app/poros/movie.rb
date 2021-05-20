class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview

  def initialize(movie)
    @id = movie[:id]
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
  end


end
