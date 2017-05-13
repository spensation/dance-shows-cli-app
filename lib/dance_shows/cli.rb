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
        puts "Would you like to read more?"

        answer = gets.strip

        if ['Y, YES'].include?(answer.upcase)
          puts "#{show.url}"
        end
      end

      puts "Would you like to list again or exit?"
      input = gets.strip

    end
  end
end
