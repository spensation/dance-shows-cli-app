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
      puts "#{i + 1} #{show.name}"
    end
  end

  def menu
  end
end
