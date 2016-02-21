$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
  s.name        = 'loadshedding'
  s.version     = '0.1.3'
  s.date        = '2016-02-16'
  s.summary     = "Command line utility for loadshedding schedule"
  s.description = "Command line utility for checking the loadshedding schedule for Nepal"
  s.authors     = ["Kapil Raj Nakhwa (@xecutioner303)"]
  s.email       = 'kapilnakhwa@gmail.com'
  s.files       = ['bin/schedule','lib/schedule_formatter.rb' ,'lib/downloader.rb', 'lib/schedule.rb',  'lib/loadshedding.rb', 'lib/schedule_parser.rb', 'lib/group_scheduler.rb', 'lib/week_day.rb', 'lib/config_loader.rb', 'lib/interfacer.rb', 'lib/day_finder.rb', 'lib/timer.rb']
  s.homepage    =
    'https://github.com/xecutioner/loadshedding-schedule'
  s.license       = 'MIT'
  s.executables << 'schedule'
  s.add_runtime_dependency 'thor', '~> 0.19.1'
  s.add_runtime_dependency 'highline', '~> 1.7', '>= 1.7.2'
  s.add_runtime_dependency 'colorize', '~> 0.7.7'
  s.add_runtime_dependency 'httparty' , '~>0.13.7'
  s.add_runtime_dependency 'time_diff' , '~> 0.3.0'
  s.post_install_message = "\nType schedule -h to get started\n\n"
end

