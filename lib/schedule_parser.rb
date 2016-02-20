class ScheduleParser
  attr_reader :schedule_yaml, :result_hash

  def initialize schedule_path
    @schedule_yaml = schedule_path
    @result_hash = Hash.new
  end

  def parse
    confirm_file
    parse_from_file(schedule_yaml)
  end

  def group_schedule(group)
    result_hash[group]
  end

 private

  def confirm_file
   unless  File.exists?(schedule_yaml)
     download
     store_to_file
   end
  end

  def download
    d = Downloader.new
    d.download
    @result_hash = d.schedule_json
  end

  def parse_from_file(schedule_yaml)
    @result_hash = YAML.load(File.read(schedule_yaml))
  end

  def store_to_file
   File.open(schedule_yaml, 'w') do |f|
    f.write(result_hash.to_yaml)
   end
  end
end
