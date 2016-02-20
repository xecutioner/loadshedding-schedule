class Schedule

  attr_reader :schedule_path, :schedule_hash

  def initialize
    @schedule_path = ""
    @schedule_hash = Hash.new
  end


  def schedule_for date
    parse_from_pdf if @schedule_hash.empty?
    @schedule_hash[date.day]
  end

  private

  def parse_from_pdf
    p = ScheduleParser.new(Downloader::INSTALL_PATH)
    p.parse
    @schedule_hash = p.result_hash
  end
end
