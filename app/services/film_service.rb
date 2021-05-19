class FilmService
  def self.get_movie_info(movie_id)
    resp = conn.get("/3/movie/#{movie_id}")
    parse_json(resp)
  end

  def self.get_first_10_credits(movie_id)
    resp = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(resp)[:cast][0..9]
  end

  def self.get_movie_reviews(movie_id)
    resp = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(resp)
  end



  def self.total_pages
    resp = conn.get('/3/movie/top_rated')
    parse_json(resp)[:total_pages]
  end

  def self.top_movies(number_of_results = 40)
    relevant_movies(2).first(number_of_results)
  end

  def self.relevant_movies( pages = total_pages)
    total = []
    pages.times do |page_number|
      resp = conn.get('/3/movie/top_rated') { |faraday| faraday.params['page'] = page_number +1}
      results = parse_json(resp)[:results]
      total.concat(results)
    end
    total
  end




  # def self.top_movies
  #   top_page1 + top_page2
  # end
  #
  # def self.top_page1
  #   resp = conn.get('/3/movie/top_rated')
  #   parse_json(resp)[:results]
  # end
  #
  # def self.top_page2
  #   resp = conn.get('/3/movie/top_rated') do |faraday|
  #     faraday.params['page'] = 2
  #   end

  #   parse_json(resp)[:results]
  # end


  def self.movie_search(title)
    search_page1(title) + search_page2(title)
  end

  def self.search_page1(title)
    resp = conn.get('/3/search/movie') do |faraday|
      faraday.params['query'] = title
    end

    parse_json(resp)[:results]
  end

  def self.search_page2(title)
    params = { query: title, page: 2 }
    resp = conn.get('/3/search/movie') do |faraday|
      params.each do |k, v|
        faraday.params[k] = v
      end
    end

    parse_json(resp)[:results]
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
