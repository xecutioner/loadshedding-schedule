class Weekday

  attr_reader :week_day

  def initialize(week_day)
    @week_day = week_day
    @mapping = {7 => "Su", 1 => 'M', 2=> "Tu", 3 => "W", 4 => "Th", 5 => "F", 6 => "Sa"}
  end

  def symbol
    @mapping[week_day]
  end
end
