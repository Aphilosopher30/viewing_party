class FilmService
  def self.get_movie_info(movie_id)
    resp = conn.get("/3/movie/#{movie_id}")
    parse_json(resp)
  end

  def self.credits(movie_id)
    resp = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(resp)
  end

  def self.get_movie_reviews(movie_id)
    resp = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(resp)
  end

  def self.top_movies(number_of_results = 40)
    link = '/3/movie/top_rated'
    relevant_movies(link).first(number_of_results)
  end

  def self.movie_search(title, number_of_results = 40)
    link = '/3/search/movie'
    query = { query: title }
    pages = total_pages(link, query)
    relevant_movies(link, query, pages).first(number_of_results)
  end

  def self.total_pages(link, params)
    resp = response(link, params)
    parse_json(resp)[:total_pages]
  end

  def self.relevant_movies(link, paramiters = {}, pages = 2)
    total = []
    pages.times do |page_number|
      params = paramiters.merge({ page: (page_number + 1) })
      resp = response(link, params)
      results = parse_json(resp)[:results]
      total.concat(results)
    end
    total
  end

  def self.response(link, params = {})
    conn.get(link) do |faraday|
      params.each do |k, v|
        faraday.params[k] = v
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_db_key']
    end
  end

  def self.parse_json(resp)
    JSON.parse(resp.body, symbolize_names: true)
  end
end
