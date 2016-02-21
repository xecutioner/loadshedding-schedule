class ScheduleFormatter
  attr_reader :formatted_result, :color

  def initialize unformatted_hash, date, group
    @unformatted_hash = unformatted_hash
    @date = find_date(date)
    @formatted_result
    @group = group
    @current_status = set_timer
    @color = set_color
  end

  def format
    @formatted_result = <<-EOS

      Load Shedding Schedule for #{@date} : #{@date.strftime('%A')}
      Group Number : #{@group}
      Morning : #{@unformatted_hash.first}
      Evening : #{@unformatted_hash.last}
      Currently: #{@current_status.status} : #{@current_status.alt_status} in #{@current_status.time_to_change}
      EOS
  end

  private
  def set_color
    @current_status.status == "Off" ? :red : :green
  end

  def set_timer
    morning_hours_range = range_from_array @unformatted_hash.first.values.map(&:to_i)
    evening_hours_range = range_from_array @unformatted_hash.last.values.map(&:to_i)
    Timer.new(morning_hours_range, evening_hours_range)
  end

  def range_from_array(array)
    Range.new(array.first, array.last)
  end

  def find_date(date)
    day_finder = DayFinder.new
    date = day_finder.find_week_day date
    day_finder.adjusted_week_date(date)
  end
end
