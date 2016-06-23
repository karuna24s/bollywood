class Bollywood::Movie
  attr_accessor :name, :cast, :release_date, :synopsis

  @@all = []

  # URL = "http://www.bollywoodmdb.com/movies/"

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  

end
