require 'highline'
class Interfacer

  def initialize
    @cli_handler = HighLine.new
  end

  def find_group
   @cli_handler.ask "Please enter your group number."
  end

  def persist(group, file)
   File.open(file,'w') do |f|
    f.write(group)
   end
  end
end
