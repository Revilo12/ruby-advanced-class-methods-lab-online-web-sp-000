require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new #creates a new song instance
    song.save #saves the new song instance
    song #returns the new song instance
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = /(?<artist>.+)\s-\s(?<song>.+).mp3/.match(filename) #patses looking for the artist and the song
    song = self.new_by_name(data[:song]) #makes a new song with the found name
    song.artist_name = data[:artist] #adds the artist name onto the song created
    song #returns the song
  end

end
