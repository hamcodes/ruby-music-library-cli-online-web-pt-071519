class Song 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
 
def self.create(name)
    song = new(name)
    song.save
    song
  end 
  
  #   def find_by_name(name)
  #       self.all.find do |song|
  #       song.name == name
  #   end
  # end
  
  # def find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end
  
  def initialize(name,artist=nil,genre=nil)
    @name = name 
    self.artist = artist
    self.genre = genre
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist
  end
  
  def self.new_from_filename(file)
    raw = file.gsub(".mp3", "")
    row = raw.split(" - ")
    song_name = row[1]
    artist = Artist.find_or_create_by_name(row[0]) 
    genre = Genre.find_or_create_by_name(row[2])
    Song.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
    
  end
  
    def genre=(genre)
    @genre = genre
    genre.add_song(self) if genre
  end
end