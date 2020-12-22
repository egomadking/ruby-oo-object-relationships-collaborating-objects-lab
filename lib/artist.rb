class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def add_song(name)
    name.artist = self
  end

  def print_songs
    Song.all.each do |song|
      if song.artist == self
        puts song.name
      end
    end
  end

  def self.find_or_create_by_name(name)
    result = all.detect do |artist| 
      artist.name == name
    end
    if result != nil
      result
    else
      self.new(name)
    end
  end

  def self.all
    @@all
  end

end