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
      puts "#{i + 1} #{show.name} - #{show.cost}"
    end
  end

  def menu
    puts 'Please enter the number of the show you would like to know more about or exit to exit:'
    input = nil
    while input != 'exit'
      input = gets.strip.downcase

      if input.to_i > 0
        puts "#{show.length}"
        call
      elsif input == 'list'
        list_shows
      elsif input == 'exit'
        exit
      else
        puts 'Not sure what you want.  Please enter a valid number or type list to see entire list.'
      end
    end
  end

  def goodbye
    puts "Thanks for checking out what's going on in the Bay Area's dance scene."
  end
end
