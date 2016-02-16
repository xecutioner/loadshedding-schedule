require 'open-uri'
class Downloader
  DOWNLOAD_PATH = 'http://nea.org.np/images/supportive_docs/3423loadshedding.pdf'
  attr_reader :path

  def initialize(download_path=nil)
   @path ||= download_path || DOWNLOAD_PATH
  end
  def download
    download = open(path)
    IO.copy_stream(download, '../assets/schedule.pdf')
  end

end
