require './route.rb'
require './station.rb'
class Train
  attr_reader :speed

  def initialize(number,type,quantity)
    @number = number
    @type = type
    @quantity = quantity.to_f
    @speed = 0
  end

  def start(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def carriage_quantity
    puts "Кол-во вагонов в составе:#{@quantity}"
  end

  def add_carriage(carriage_type)
    if @speed <= 0 and @carriage_type == @type
      @quantity += 1
    elsif @speed => 0
      puts "STOP THE TRAIN!"
    else
      puts "Wrong carriage type"
    end
  end

  def remove_carriage
    if @speed <= 0
      @quantity -= 1
    else
      puts "Поезд на ходу"
    end
  end

  def set_route(route)
    @route = route
    @index_current_station = 0
    current_station.train_arrive(self)
  end

  def move_forward
    current_station.train_left(self)
    @index_current_station += 1 if @route.route_list.size - 1 > @index_current_station
    current_station.train_arrive(self)
  end

  def move_backward
    current_station.train_left(self)
    @index_current_station -= 1 unless @index_current_station.zero?
    current_station.train_arrive(self)
  end

  def previous_station
    station_by_index @index_current_station - 1
  end

  def current_station
    station_by_index @index_current_station
  end

  def next_station
    station_by_index @index_current_station + 1
  end

  protected

  def station_by_index(index)
    return nil if index < 0
    @route.route_list[index]
  end
end
