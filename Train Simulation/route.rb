require_relative 'instances.rb'

class Route
  attr_reader :route_list,:start_station,:end_station
  extend Instances::ClassMethods
  include Instances::InstanceMethods

  def initialize(start_route,end_route)
    @route_list = [start_route, end_route]
    validate!
    register_instances
    puts "Маршрут создан!"
  end

  def validate!
    raise "Start station name can't be nil" if @route_list[0].nil?
    raise "End station name can't be nil" if @route_list[1].nil?
    raise "End station and Start station can't have same names" if @route_list[0] == @route_list[1]
  end

  def add_station(station)
    validate!
    raise "Wrong class" if station.class != Station
	  @route_list.insert(-2, station)
  end

  def delete_station(station)
	  @route_list.delete(station)
  end

  def show_stations
    @route_list
  end
end
