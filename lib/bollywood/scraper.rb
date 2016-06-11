class Bollywood::Scraper

  def self.scrape_movie
     doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
     movies = []
     doc.css("div.row.move-data.spacer").each do |container|
       container.css("a.movie-link").each do |movie|
         movies << movie
       end
     end
     movies
  end

  def self.scrape_cast
     doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
     casts = []
     doc.css("div.row.move-data.spacer").each do |container|
       container.css("a.aheight").each do |cast|
         casts << cast
       end
     end
     casts
  end

  def self.scrape_release_date
     doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
     release_dates = []
     doc.css("div.row.move-data.spacer").each do |container|
       container.css("a.aheight").each do |release_date|
         release_dates << release_date
       end
     end
     release_dates
  end

end


  # movie.name = movie.css("a.movie-link").text
  # movie.cast = movie.css("a.aheight").text
  # movie.release_date = movie.css("div.spacer.hidden-xs").text
