class Bollywood::Movie
  attr_accessor :name, :cast, :release_date, :url

  @@all = []

  # URL = "http://www.bollywoodmdb.com/movies/"

  def initialize#(name = nil, url = nil)
    # @name = name
    # @cast = cast
    # @release_date = release_date
    # @url = url
    @@all << self
  end

  def self.all
    @@all ||= Bollywood::Scraper.scrape_movie
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
     self.all.detect do |movie|
       movie.name.downcase.strip == name.downcase.strip ||
       movie.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  # def cast
  #   @cast ||= cast_doc.css(".spacer ").text
  #
  # end
  #
  # def release_date
  #    @release_date ||= release_date_doc.css(".spacer hidden-xs").text
  # end


  # def self.scrape_movie
  #    doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
  #    movies = []
  #    doc.css("div.row.move-data.spacer").each do |movie|
  #      movie.name = movie.css("a.movie-link").text
  #      movie.cast = movie.css("a.aheight").text
  #      movie.release_date = movie.css("div.spacer.hidden-xs").text
  #        movies << movie
  #    end
  #    movies
  # end
    #  doc.css("div.row.move-data.spacer") #-> entire container of movie,cast and release_date
    #  movie.name = doc.css("div.row.move-data.spacer")[0].css("a.movie-link").text #-> name of movie
    #  movie.cast = doc.css("div.row.move-data.spacer")[0].css("a.aheight").text #-> cast
    #  movie.release_date = doc.css("div.row.move-data.spacer")[0].css("div.spacer.hidden-xs").text #-> release_date
    #  doc.css("div.row.move-data.spacer").each do |x| {
     #
    #  }
  #    names = doc.css(".spacer .movie-link strong").first.text
  #    names = doc.css(".spacer .movie-link strong").each {|movie_list| puts movie_list.text}
  #end

  # def release_date_doc
  #    @release_date_doc ||= Nokogiri::HTML(open("#{self.url}releasedate"))
  # end
  #
  # def doc
  #    @doc ||= Nokogiri::HTML(open(self.url))
  # end

end

#instance of the class
# Bollywood::Movie.new.scrape_movie
# awesome_new_movie = Bollywood::Movie.new
# awesome_new_movie.scrape_movie


# class method
# Bollywood::Movie.scrape_movie
