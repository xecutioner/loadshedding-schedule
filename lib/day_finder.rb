class DayFinder
  def initialize
  end

  def find_week_day(week_day)
    week_day==0 ? Date.today.cwday : validate_week_day(week_day)
  end

  def validate_week_day(week_day)
    (1..7).cover?(week_day) ? week_day : invalid_week_day
  end

  def adjusted_week_date(week_day)
    today = Date.today.cwday
    difference = (today - week_day)
    Date.today - difference
  end

  private
  def invalid_week_day
    puts "invalid week day supplied"
    abort
  end
end
