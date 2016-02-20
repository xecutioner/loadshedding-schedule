class Schedule

  def schedule_for date, group
    group_schedule = GroupSchedule.new(group)
    group_schedule.day_schedule date
  end


end
