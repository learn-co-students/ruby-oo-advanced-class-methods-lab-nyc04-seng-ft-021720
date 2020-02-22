require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.name=(name)
    @@name = name
  end

  def self.artist_name=(artist_name)
    @@artist_name = artist_name
  end

  def self.name
    @@name
  end

  def self.artist_name
    @@artist_name 
  end


  def save
    self.class.all << self
  end

  #need to initialize the song, save it, then return the
  #song that was init'd
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    # binding.pry
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    # binding.pry
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    # self.all.each{ |track|
    #   return track if track.name ==  name
    # }
    # return false
    # 41-44 is messy- need to find how to write w/o each if possible...
    self.all.find{ |track| track.name == name }
  end

  def self.find_or_create_by_name(name)
    #accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance.
    # binding.pry
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|track|
      track.name
    }
  end

  def self.new_from_filename(filename)
    trimmed_str = filename.delete_suffix(".mp3")
    ar = trimmed_str.split(" - ")
    # 0th element in ar is the Artist, 1st element is the song title
    song = self.new_by_name(ar[1])
    song.artist_name = ar[0]
    song
    binding.pry
  end

  def self.create_from_filename(filename)
    trimmed_str = filename.delete_suffix(".mp3")
    ar = trimmed_str.split(" - ")
    # 0th element in ar is the Artist, 1st element is the song title
    song = self.create_by_name(ar[1])
    song.artist_name = ar[0]
    song
  end

  def self.destroy_all
    @@all = []
  end
end