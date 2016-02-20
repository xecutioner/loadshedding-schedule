class GroupSchedule

  attr_reader :group_schedule

  def initialize group
    @group = validate_group(group)
    @group_schedule = load_schedule
  end

  def day_schedule week_day
    week_day_obj = Weekday.new(week_day)
    group_schedule[week_day_obj.symbol]
  end

  private

  def validate_group(group)
    (1..7).cover?(group.to_i) ? group : invalid_group
  end

  def load_schedule
    p = ScheduleParser.new(Downloader::INSTALL_PATH)
    p.parse
    @group_schedule = p.group_schedule(@group)
  end

  def invalid_group
    puts "Invalid group number supplied"
    abort
  end
end
