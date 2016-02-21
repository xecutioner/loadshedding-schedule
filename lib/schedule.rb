class Schedule

  # Returns the schedule for specific date and group
  # @param date takes in weekday number
  # @param group takes in group number
  def schedule_for date, group
    group_schedule = GroupSchedule.new(group)
    group_schedule.day_schedule date
  end


end
