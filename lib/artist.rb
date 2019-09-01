class Artist
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new(name).save
    self
  end
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    songs.collect { |song| song.genre }.uniq
  end
  
end