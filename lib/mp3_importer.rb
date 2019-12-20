require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect do |file|
     file.gsub("#{path}/", "")
    end
  end

  def import
     files.each{|fil| Song.new_by_filename(fil)}
     #binding.pry
  end

end
