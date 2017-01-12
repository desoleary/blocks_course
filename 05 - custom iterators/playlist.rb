require_relative 'song'
require_relative 'my_enumerable'

class Playlist
  # include Enumerable
  include MyEnumerable # for demonstration purposes we will be making up our own enumerable module

  def initialize(name)
    @name  = name
    @songs = []
  end

  def add(song)
    @songs << song
  end

  def each
    @songs.each {|song| yield song}
  end

  def play_songs
    each { |song| song.play }
  end

  def each_tagline
    @songs.each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist(artist)
    my_select { |song| song.artist == artist }.each { |song| yield song }
  end

  def each_filename
    basename = "#{name}-#{artist}".gsub(' ', '-').downcase
    extensions = %w(.mp3 .wav .aac)
    extensions.each { |ext| yield basename + ext }
  end
end

playlist = Playlist.new('Best of')

playlist.add Song.new('Live Forever', 'Oasis', 4)
playlist.add Song.new('Shine on you crazy Diamond', 'Pink Flyod', 12)
playlist.add Song.new('Pyramid Song', 'Radiohead', 5)
playlist.add Song.new('thirdeye', 'Tool', 14)

playlist.play_songs

thirdeye_song = playlist.my_select { |song| song.name =~ /eye/ }
p thirdeye_song

non_thirdeye_songs = playlist.my_reject { |song| song.name =~ /eye/ }
p non_thirdeye_songs

p playlist.my_any? { |song| song.artist == "Oasis" }

p playlist.my_detect { |song| song.artist == "Oasis" }

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.reduce(0) { |sum, song| sum + song.duration }
p total_duration