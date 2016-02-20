class ScheduleParser
  attr_reader :schedule_yaml, :result_hash

  def initialize schedule_path
    @schedule_yaml = schedule_path
    @result_hash = Hash.new
  end

  def parse
    confirm_file
  end

 private

  def confirm_file
   unless  File.exists?(schedule_yaml)
    d = Downloader.new
    d.download
    result_hash = d.schedule_json
   end
  end
end
