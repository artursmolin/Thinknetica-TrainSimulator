require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'main.rb'

railway = Main.new
strela = CargoTrain.new(strela, cargo, 33)
moscow1 = Route.new(moscow, sochi)
