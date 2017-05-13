class DanceShows::Show

  attr_accessor :name, :cost, :description, :url

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
