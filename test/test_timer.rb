require 'minitest/autorun'
require 'timer'
require 'time'
require 'pry'

class TimerTest < Minitest::Test
  def test_timer
    morning_range = 10..11
    evening_range = 14..15
    current_time = Time.parse("16:00",Time.now)
    t = Timer.new(morning_range, evening_range, current_time)
    # you may be wondering why there is no assertion here . It is because I am just making sure no exception is raised here.
    # https://github.com/seattlerb/minitest/issues/70
    # https://github.com/seattlerb/minitest/issues/159
    # http://blog.zenspider.com/blog/2012/01/assert_nothing_tested.html
  end

end
