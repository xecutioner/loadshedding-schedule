class DayFinder
  def initialize
  end
  # finds the weekday and validates it
  # @param week_day as an integer starting from monday as 1
  def find_week_day(week_day)
    week_day==0 ? Date.today.cwday : validate_week_day(week_day)
  end

  # Validates the weekday to be within the week
  def validate_week_day(week_day)
    (1..7).cover?(week_day) ? week_day : invalid_week_day
  end

  # Adjusts the week date for the -g parameter
  def adjusted_week_date(week_day)
    today = Date.today.cwday
    difference = (today - week_day)
    Date.today - difference
  end

  private
  def invalid_week_day
    puts "invalid week day supplied".colorize(:yellow).colorize(:background => :red)
    abort
  end
end
