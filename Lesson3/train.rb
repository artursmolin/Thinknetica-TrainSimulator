class Train 
  attr_reader :speed

  def initialize(train_number,train_type,quantity)
    @train_number = train_number
    @train_type = train_type
    @quantity = quantity.to_f
    @speed = 0
  end

  def start(speed)
    @speed = speed
  end

  def current_speed
    puts "Текущая скорость:#{@speed} км/ч"
  end

  def stop
    @speed = 0
  end

  def carriage_quantity
    puts "Кол-во вагонов в составе:#{@quantity}"
  end

  def add_carriage
    if @speed <= 0
      @quantity += 1
    else puts "Поезд на ходу"
  end

  def remove_carriage
    if @speed <= 0
      @quantity -= 1
    else puts "Поезд на ходу"
    end
  end

  def set_route(route)
    @route = route
    @index_current_station = 0
  end

  def move_forward
    @index_current_station += 1 if @route.stations.size - 1 > @index_current_station
  end

  def move_backward
    @index_current_station -= 1 unless @index_current_station.zero?
  end

  def previous_station
    get_station_by_index @index_current_station - 1
  end

  def current_station
    get_station_by_index @index_current_station
  end

  def next_station
    station_by_index @index_current_station + 1
  end

  def station_by_index(index)
    return nil if index < 0
    @route.station_list[index]
  end
end

