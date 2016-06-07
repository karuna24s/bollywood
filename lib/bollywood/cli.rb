class Bollywood::CLI

  def call
    welcome
    list_options
    menu
    phir_milenge
  end

  def welcome
    puts "Welcome to the Bollywood CLI Gem:"
  end

  def list_options
    puts <<-DOC.gsub /^\s*/, ''
      1. Would you like to learn more about a Bollywood movie?
      2. Would you like to learn more about a Bollyword celebrity?
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number to learn more, type list to see the options, or type exit."
      input = gets.strip.downcase
      case input
      when "1"
        @movies = Bollywood::movie.movie_name
        # puts "You will be given a prompt to type the movie's and the Cast & Synopsis  will appear"
      when "2"
        @celebrities = Bollywood::celebrity.celebrity_name
        # puts "You will be given a prompt to type the celebrity's name and the Filmography will appear"
      when "list"
        list_options
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def phir_milenge
    puts "Phir Milenge -> See You Soon!"
  end


end
