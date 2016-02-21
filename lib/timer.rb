require 'time_diff'

class Timer
 attr_reader :status, :alt_status, :time_to_change

 # Gives back a timer object
 # @param morning_range Range object having from and to hours
 # @param evening_range Range object having from and to hours

 def initialize(morning_range, evening_range)
    @morning_range = morning_range
    @evening_range = evening_range
    @current_time = Time.now
    @time_to_change = find_remaining_time
    @status = find_status
    @alt_status = alternate_status
  end




  private

  def alternate_status
    currently_off? ? "On" : "Off"
  end

  def find_status
    currently_off? ? "Off" : "On"
  end

  def currently_off?
    @morning_range.cover?(@current_time.hour) || @evening_range.cover?(@current_time.hour)
  end


  def find_remaining_time
    if currently_off?
      time = time_to_on
    else
      time = time_to_off
    end
    " #{time[:hour]} hour : #{time[:minute]} minutes "
  end

  def time_to_on
    if @morning_range.cover?(@current_time.hour)
      t = change_to_time(@morning_range.last)
    else
      t = change_to_time(@evening_range.last)
    end
    diff = time_difference(t)
  end

  def time_to_off
    upcoming_hours = [@morning_range.first, @morning_range.last, @evening_range.first, @evening_range.last].delete_if{|a| a < @current_time.hour}
    closest_hour = upcoming_hours.min_by {|x| (x - @current_time.hour)}
    t = change_to_time(closest_hour)
    diff = time_difference(t)
  end

  def time_difference(t)
    time_difference_components = Time.diff(@current_time , t)
  end

  def change_to_time(hour)
    Time.parse("#{hour}:00",Time.now)
  end


end

