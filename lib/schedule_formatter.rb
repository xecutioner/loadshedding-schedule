class ScheduleFormatter
  attr_reader :formatted_result

  def initialize unformatted_hash, date
    @unformatted_hash = unformatted_hash
    @date = date
    @formatted_result
  end

  def format
    @formatted_result = <<-EOS
      Load Shedding Schedule for #{@date} : #{@date.strftime('%A')}
      Morning : #{@unformatted_hash.first}
      Evening : #{@unformatted_hash.last}
    EOS
  end
end
