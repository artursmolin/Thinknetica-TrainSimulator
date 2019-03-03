require_relative 'instances.rb'

class Route
  attr_reader :route_list, :start_station, :end_station
  extend Instances::ClassMethods
  include Instances::InstanceMethods

  def initialize(start_route, end_route)
    @stations = [start_route, end_route]
    validate!
    register_instances
    puts 'Маршрут создан!'
  end

  def validate!
    raise "Stations can't have same names" if @stations[0] == @stations[1]
    raise 'This is not Station object' unless
    @stations.all? { |station| station.class == Station }
  end

  def add_station(station)
    validate!
    raise 'Wrong class' if station.class != Station

    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_stations
    @stations
  end
end
