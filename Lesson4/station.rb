  class Station
<<<<<<< HEAD
  attr_reader :train
  include Instances

  def self.all
    puts @stations
  end
=======
  attr_reader :station_list,:train
>>>>>>> 840f7a1a8c87e79c7dea95c264348a28d8fe2d96

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    self.class.register_instances
  end

  def train_arrive(train)
    @trains << train
  end

  def train_left(train)
	  @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.map { |train| train.type == type }
  end

  def trains
	  puts @trains
  end
end
