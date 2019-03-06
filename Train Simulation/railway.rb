require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'main.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passenger_wagon.rb'
require_relative 'text_menu.rb'
require_relative 'validation.rb'
require_relative 'accessors.rb'

railway = Main.new
railway.start
