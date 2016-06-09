class Bollywood::Celebrity
  attr_accessor :name, :filmography, :url

  URL = "http://www.imdb.com/"

  def initialize(name, filmography, url)
    @name = name
    @filmography = filmography
    @url = url
  end

end
