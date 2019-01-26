  class Station
  attr_reader :station_list,:train

  def initialize(station_name)
    @station_name = station_name
    @trains = []
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
