class Bollywood::CLI

  def call
    welcome
    list_options
    menu
    phir_milenge
  end

  def welcome
    puts "Welcome to the Bollywood CLI Gem Where You Can Learn About the Upcoming Movies!"
  end

  def list_options
    Bollywood::Scraper.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
    end
  end

  def print_movie(movie)
    puts "#{movie.name}"
    puts movie.cast
    puts movie.release_date
  end

  def menu
    input = nil
    while input != "exit"
      puts "Select which movie you would like to learn about by typing number."
      puts "Type menu to see the list of movies again, or type exit to end the program."
      input = gets.strip.downcase
      if input.to_i > 0
        if movie = Bollywood::Scraper.find(input.to_i)
           print_movie(movie)
        end
      elsif input == "menu"
        list_options
      else
        puts "Not sure what you want? Type menu or exit." unless input == "exit"
      end
    end
  end

  def phir_milenge
    puts "Phir Milenge -> See You Soon!"
  end

end

# if input.to_i == 0
#   if movie = Bollywood::Movie.find_by_name(input)
#     print_movie(movie)
#   end
