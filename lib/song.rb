class  Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    split_data = file_name.gsub(".", "-").split("-")
    title = split_data[1]
    artist = split_data[0]

    song = Song.new(title.strip)
    song.artist = Artist.find_or_create_by_name(artist.strip)
    song
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
    #binding.pry
  end

end
