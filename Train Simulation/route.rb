require_relative 'instances.rb'

class Route
  attr_reader :route_list,:start_station,:end_station
  extend Instances::ClassMethods
  include Instances::InstanceMethods

  def initialize(start_station,end_station)
	  @route_list = [start_station, end_station]
    validate!
    register_instances
    puts "Маршрут создан!"
  end

  def validate!
    raise "Start station name can't be nil" if @route_list[0].nil? or @route_list[0].length.zero?
    raise "End station name can't be nil" if @route_list[1].nil? or @route_list[1].length.zero?
    raise "End station and Start station can't have same names" if @route_list[0] == @route_list[1]
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
