require_relative 'instances.rb'

class Route
  attr_reader :route_list,:start_station,:end_station
  extend Instances::ClassMethods
  include Instances::InstanceMethods

  def initialize(start_station,end_station)
	  @route_list = [start_station, end_station]
    register_instances
    puts "Маршрут создан!"
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
