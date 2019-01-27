class Route
  attr_reader :route_list,:start_station,:end_station

  def initialize(start_station,end_station)
	  @route_list = [start_station, end_station]
    self.class.register_instances
  end

  def add_station(station)
	  @route_list.insert(-2, station)
  end

  def delete_station(station)
	  @route_list.delete(station)
  end

  def show_stations
    @route_list
  end
end
