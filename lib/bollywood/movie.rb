class Bollywood::Movie
  attr_accessor :name, :cast, :synopsis, :url

  URL = "http://www.imdb.com/"

  def initialize(name, cast, synopsis, url)
    @name = name
    @cast = cast
    @synopsis = synopsis
    @url = url
  end

  def self.movie_prompt
     puts "Type the name of the movie: #{name}."
     input = gets.strip
  end

end
