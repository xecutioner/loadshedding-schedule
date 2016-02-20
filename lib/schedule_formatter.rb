class ScheduleFormatter
  attr_reader :formatted_result

  def initialize unformatted_hash, date, group
    @unformatted_hash = unformatted_hash
    @date = find_date(date)
    @formatted_result
    @group = group
  end

  def format
    @formatted_result = <<-EOS
      Load Shedding Schedule for #{@date} : #{@date.strftime('%A')}
      Group Number : #{@group}
      Morning : #{@unformatted_hash.first}
      Evening : #{@unformatted_hash.last}
    EOS
  end

  def find_date(date)
    day_finder = DayFinder.new
    date = day_finder.find_week_day date
    day_finder.adjusted_week_date(date)
  end
end
