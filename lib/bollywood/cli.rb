class Bollywood::CLI
  def call
    welcome
    list_movies
    menu
    phir_milenge
  end

  def welcome
    puts ""
    puts "********** Welcome to the Bollywood CLI Gem Where You Can Learn About the Upcoming Movies! **********"
    puts ""
  end

  def list_movies
    Bollywood::Scraper.scrape_data
    Bollywood::Movie.all.each.with_index(1) do |movie, i|
      if i <= 20
        puts "#{i}. #{movie.name}"
      end
    end
    puts ""
  end

  def print_movie(movie)
    puts ""
    puts  "-------------- #{movie.name} --------------"
    puts ""
    puts movie.cast
    puts ""
    puts movie.release_date
    puts ""
    puts movie.synopsis
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      puts "Select which movie you would like to learn about by typing number."
      puts "Type menu to see the list of movies again, or type exit to end the program."
      input = gets.strip.downcase
      if input.to_i > 0
        if movie = Bollywood::Movie.find(input.to_i)
           print_movie(movie)
        end
      elsif input == "menu"
        list_movies
      else
        puts "Not sure what you want? Type menu or exit." unless input == "exit"
      end
    end
  end

  def phir_milenge
    puts "Phir Milenge -> See You Soon!"
  end
end
