require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def Song.new_by_name(name)
    new_song = self.new
    new_song.name = name 
    new_song 
  end 

  def Song.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def Song.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def Song.alphabetical
    self.all.sort_by {|songs| songs.name}
  end 

  def Song.new_from_filename(filename)
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1].delete_suffix(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    new_song = Song.create
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1].delete_suffix(".mp3")
    new_song.name = song_name
    new_song.artist_name = artist_name
  end

def Song.destroy_all
  self.all.clear
end

end
