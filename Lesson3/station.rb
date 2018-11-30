class Station
  attr_reader :station_list

  def initialize(station_name)
	@station_name = station_name
    @station_list = []
  end

  def train_arrive(train_number)
    @station_list << train_number
  end

  def train_left(train_number)
	@station_list.delete("#{@train_number}")
  end

  def trains_by_type(type)
    @station_list.map { |train_number| train_number if train_number.type == type }
  end

  def station_list
	puts @station_list
  end
end
