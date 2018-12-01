require './train.rb'
require './station.rb'

class Route
  attr_reader :route_list
		
  def initialize(start_station,end_station)
	  @route_list = [start_station, end_station]
  end

  def add_station(station)
	  @route_list.insert(-2, station)
  end

  def delete_station(station)
	  @route_list.delete(station) if @route_list.first != station && @route_list.last != station
    end
  end

  def show_stations
    @route_list.each_with_index do |station, index|
    puts "#{index + 1}: #{station}"
  end
end