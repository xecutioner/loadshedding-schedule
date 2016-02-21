require 'highline'
class Interfacer

  def initialize
    @cli_handler = HighLine.new
  end

  # asks user for the group number
  def find_group
   @cli_handler.ask "Please enter your group number(will be set as default).".colorize(:red)
  end

  # Saves the group into the file
  # @param group group number in inteder
  # @param file path of file
  def persist(group, file)
   File.open(file,'w') do |f|
    f.write(group)
   end
  end
end
