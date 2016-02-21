class ConfigLoader
  CONFIG_FILE=File.expand_path('~/.load_shedding_config')
  class << self
    # Loads the group data
    def load_group
      klass =  File.exists?(CONFIG_FILE) ? self : Interfacer
      obj = klass.new
      group = obj.find_group
      obj.persist(group, CONFIG_FILE) if obj.respond_to?(:persist)
      group
    end

    # sets the group data after asking form user
    def set_group
      obj = Interfacer.new
      group = obj.find_group
      obj.persist(group,CONFIG_FILE)
    end
  end

  # loads the group information form the file
  def find_group
    File.read(CONFIG_FILE)
  end

end


