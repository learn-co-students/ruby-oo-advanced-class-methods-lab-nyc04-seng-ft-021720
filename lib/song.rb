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
    @@all.push(song)
    song
  end 
  
  def self.new_by_name(string)

    song = Song.new
    song.name = string 
    song 
  end 

  def self.create_by_name(string)
    song = self.create
    song.name = string 
    song
  end 

  def self.find_by_name(string)
   self.all.find{|song| song.name == string}
  end 

  def self.find_or_create_by_name(string)
    
    self.find_by_name(string) || self.create_by_name(string)
  end 
  
  def self.alphabetical
    self.all.sort_by {|songs| songs.name}
  end 

  def self.new_from_filename(song_file)
    song_file = song_file.split(/[-.]/)
    song_file = song_file.collect{|x| x.strip}
    song_name = song_file[1]
    artist_name = song_file[0]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(song_file)
    song_file = song_file.split(/[-.]/)
    song_file = song_file.collect{|x| x.strip}
    song_name = song_file[1]
    artist_name = song_file[0]

    song = self.create_by_name(song_name)
    song.artist_name = artist_name

  end

  def self.destroy_all
    self.all.clear
  end 

end
