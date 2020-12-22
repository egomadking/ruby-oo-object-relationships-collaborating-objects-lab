require "pry"
class MP3Importer

  attr_accessor :path


  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect do |f|
      f.gsub("#{path}/", "")
    end

    # mp3_files = Dir.glob("#{@path}/*.mp3")
    # mp3_files.each do |file|
    #   file_name = file.gsub("#{@path}/", "")
    #   @files << file_name
    # end

  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end