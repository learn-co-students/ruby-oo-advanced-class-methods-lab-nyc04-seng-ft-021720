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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if found_song = self.find_by_name(song_name)
      found_song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)  #String   # "ArtistName - SongName.mp3"
    artist_track = filename.delete_suffix!('.mp3').split(' - ')
    new_song = self.new_by_name(artist_track[1])
    new_song.artist_name = artist_track[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
