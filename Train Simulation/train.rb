require_relative 'manufacturer.rb'
require_relative 'instances.rb'
require_relative 'valid.rb'

class Train
  NUMBER_FORMAT = /^[\w|\d]{3}-?[\w|\d]{2}$/.freeze
  attr_reader :speed, :type, :route
  include Manufacturer
  extend Instances::ClassMethods
  include Instances::InstanceMethods
  include Valid

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type, _carriage)
    @number = number
    @type = type
    validate!
    @carriage = 0
    @speed = 0
    @wagons = []
    @manufacturer = ''
    register_instances
  end

  def validate!
    raise "Number can't be nil" if @number.nil? || @number.length.zero?
    raise 'Wrong number format' unless correct_number?
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

  def carriage
    puts "Кол-во вагонов в составе:#{@wagons.length}"
  end

  def add_carriage(wagon)
    if wagon.type == type
      @wagons << wagon
      puts "Вагон #{wagon.type} прицеплен!"
    else
      puts 'Тип вагона не совпадает с типом поезда'
    end
  end

  def remove_carriage
    if !@wagons.empty?
      @wagons.delete_at(0)
      puts 'Вагон отцеплен!'
    else
      puts 'Вагоны отсутствуют!'
    end
  end

  def set_route(route)
    @route = route
    @index_current_station = 0
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
    raise 'No route loaded, no current station' unless @route

    @route.stations[@index_current_station]
  end

  def next_station
    station_by_index @index_current_station + 1
  end

  def train_instances
    instanses
  end

  protected

  def station_by_index(index)
    return nil if index < 0

    @route.stations[index]
  end

  def correct_number?
    NUMBER_FORMAT.match(@number).nil? ? false : true
  end
end
