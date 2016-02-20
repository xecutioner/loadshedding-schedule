class GroupSchedule

  attr_reader :group_schedule

  def initialize group
    @group = group
    @group_schedule = load_schedule
  end

  def day_schedule week_day
    week_day_obj = Weekday.new(week_day)
    group_schedule[week_day_obj.symbol]
  end

  private

  def load_schedule
    p = ScheduleParser.new(Downloader::INSTALL_PATH)
    p.parse
    @group_schedule = p.group_schedule(@group)
  end

end
