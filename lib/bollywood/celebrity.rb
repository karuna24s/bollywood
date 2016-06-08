class Bollywood::Celebrity
  attr_accessor :name, :filmography, :url

  URL = "http://www.imdb.com/"

  def initialize(name, filmography, url)
    @name = name
    @filmography = filmography
    @url = url
  end

  def self.celebrity_prompt
    puts "You will be given a prompt to type the celebrity's name and the Filmography will appear"
  end

end
