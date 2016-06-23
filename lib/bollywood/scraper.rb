class Bollywood::Scraper

  def self.scrape_data
    doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
    # Remove google ads from doc
    doc.css(".mob_a").remove
    doc.css("div.row.move-data.spacer").each do |m|
      movie = Bollywood::Movie.new
      # Prevent the name of the movie from being repeated twice.
      #movie.name.slice!((movie.name.length/2)..movie.name.length)
      movie.name = m.css("a.movie-link").first.text
      # Created an array to iterate the cast members of a movie correctly with a
      # space between each name.
      movie.cast =  m.css("a.aheight").collect {|c| c.text }
      # Created an array to iterate the release date and synopsis of a movie
      # correctly since the css attribute which I scraped from the website from was the
      # same for both release date and synopsis.
      movie_date_synopsis = []
        m.css("div.spacer.hidden-xs").each do |d|
          movie_date_synopsis << d.text
        end
      movie.release_date = movie_date_synopsis[0]
      movie.synopsis = movie_date_synopsis[1]
      if movie.synopsis == nil
        movie.synopsis = "There is no synopsis available!"
      end
    end
  end

end
