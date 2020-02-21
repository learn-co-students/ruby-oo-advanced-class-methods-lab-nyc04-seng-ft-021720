require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|songs| songs.name}
  end
  
  def self.new_from_filename(filename)
    artist_and_name = filename.split(/ - |.mp3/)
    song = self.new_by_name(artist_and_name[1])
    song.artist_name = artist_and_name[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
