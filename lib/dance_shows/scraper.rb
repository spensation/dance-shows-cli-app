class DanceShows::Scraper

  def scrape_shows
    @doc = Nokogiri::HTML(open('http://dancersgroup.org/community-calendar/'))
    @doc.search("div.type-tribe_events").each do |show_div|
      show = DanceShows::Show.new

      #binding.pry

      show.name = show_div.search('h2 a').first.attributes['title'].value
      show.venue = show_div.search('.tribe-events-venue-details').children[0..2].text.gsub("\n", "").gsub("\t", "")
      show.cost = show_div.search(".tribe-events-event-cost").children.text.strip
      show.date = show_div.search(".tribe-event-schedule-details").children.text.strip
      show.description = show_div.search("p").text.strip

      show.save

    end
  end
end
