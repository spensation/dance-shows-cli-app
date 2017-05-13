class DanceShows::Scraper

  def scrape_shows
    @doc = Nokogiri::HTML(open('http://dancersgroup.org/community-calendar/'))
    @doc.search("div.type-tribe_events").each do |show_div|
      show = DanceShows::Show.new

      #binding.pry

      show.name = show_div.search('h2 a').first.attributes['title'].value
      show.cost = show_div.search(".tribe-events-event-cost").children.text.strip


      show.save

    end
  end
end
