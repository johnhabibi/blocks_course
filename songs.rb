class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    basename = "#{name}-#{artist}".gsub(" ", "-").downcase
    extensions = [".mp3", ".wav", ".aac"]
    extensions.each { |ext| yield basename + ext }
  end
end

song1 = Song.new("Walls", "Emery", 3)
song2 = Song.new("Never Take Friendship Personal", "Anberlin", 4)
song3 = Song.new("Bullet to Binary", "mewithoutYou", 2)

class Playlist
  include Enumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def play_song
    each { |song| song.play }
  end

  def each_tagline
    @songs.each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist
    select { |song| song.artist == artist }.each { |song| yield song }
  end
end

playlist = Playlist.new("Growing up!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

building_songs = playlist.select { |song| song.name =~ /Wall/ }
p building_songs
