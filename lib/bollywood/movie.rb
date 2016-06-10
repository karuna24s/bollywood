class Bollywood::Movie
  attr_accessor :name, :cast, :release_date, :url

  @@all = []

  URL = "http://www.bollywoodmdb.com/movies/"

  def initialize(name = nil, cast = nil, release_date = nil, url = nil)
    @name = name
    @cast = cast
    @release_date = release_date
    @url = url
    @@all << self
  end

  def self.all
    @@all ||= scrape_movie
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


  def self.scrape_movie
     doc = Nokogiri::HTML(open('http://www.bollywoodmdb.com/movies/'))
     binding.pry
     names = doc.css(".spacer .movie-link strong").first.text
     names.collect{|e| new(e.text.strip, "http://www.bollywoodmdb.com/movies/#{e.attr("href").split("?").first.strip}")}

  end

end
