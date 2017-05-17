class DanceShows::Show

  attr_accessor :name, :venue, :cost, :description, :date

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
