class DanceShows::CLI

  def call
    puts "Welcome to Dance Shows.  Find out about upcoming performances in the Bay Area."
    DanceShows::Scraper.new.scrape_shows
    list_shows
    menu
    goodbye
  end

  def list_shows
    DanceShows::Show.all.each.with_index do |show, i|
      puts "#{i + 1} #{show.name} - #{show.venue} --- #{show.cost}"
    end
  end

  def menu
    puts 'Please enter the number of the show you would like to know more about or exit to exit:'
    input = nil
    while input != 'exit'
      input = gets.strip.downcase

      if input.to_i <= DanceShows::Show.all.size
        show = DanceShows::Show.all[input.to_i - 1]
        puts "#{show.description}"
        puts "Would you like to see the list again? Y/N"

        answer = gets.strip

        if answer == 'Y'
          list_shows
        elsif answer == 'N' 
          goodbye
        else
          puts 'Please enter Y or N.'
        end
      end

      # puts "Would you like to list again or exit?"
      # input = gets.strip

    end
  end

  def goodbye
    puts "Thanks for visiting!"
    exit
  end
end
