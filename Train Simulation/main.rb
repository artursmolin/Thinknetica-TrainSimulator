require_relative 'valid.rb'

class Main
  include Valid
  attr_reader :wagons
  NUMBER_FORMAT = /^[\w|\d]{3}-?[\w|\d]{2}$/

  def initialize
    @trains = []
    @stations = []
    @route_list = []
  end

  def start
    loop do
      main_menu
    end
  end

  def main_menu
    puts "Привет! Это классная симуляция железной дороги. Что ты хочешь сделать?"
    puts "Введите 1, если вы хотите создать поезд, станцию или маршрут"
    puts "Введите 2, если вы хотите работать с созданными объектами"
    puts "Введите 3, если вы хотите вывести текущие данные об объектах"
    choice = gets.chomp
    if choice == "1"
      puts "Создание объекта"
      puts "Введите 1, если вы хотите создать новый поезд"
      puts "Введите 2, если вы хотите создать новую станцию"
      puts "Введите 3, если вы хотите создать новый маршрут"
      puts "Введите 4, если вы хотите удалить станцию"
      choice = gets.chomp
        if choice == "1"
          attemps = 0
          begin
            new_train
          rescue => e
            attemps += 1
            puts "Exception:#{e.message}"
            puts "Ваши данные неверны. Введите данные еще раз. Использованных попыток #{attemps}"
            retry if attemps < 3
          end
        elsif choice == "2"
          new_station
        elsif choice == "3"
          new_route
        elsif choice == "4"
          delete_station
        end
    elsif choice == "2"
      puts "Работа с существующими объектами"
      puts "Введите 1, если вы хотите назначить маршруту поезд"
      puts "Введите 2, если вы хотите добавить вагон к поезду"
      puts "Введите 3, если вы хотите отцепить вагон от поезда"
      puts "Введите 4, если вы хотите переместить поезд"
      puts "Введите 5, если вы хотите установить производителя для поезда"
      puts "Введите 6, если вы хотите узнать производителя поезда"
      choice = gets.chomp
        if choice == "1"
          set_route_to_train
        elsif choice == "2"
          add_carriage_to_train
        elsif choice == "3"
          remove_carriage_to_train
        elsif choice == "4"
          puts "Введите 1, если хотите переместить поезд на станцию вперед"
          puts "Введите 2, если хотите переместить поезд на станцию назад"
          choice = gets.chomp
            if choice == "1"
              move_forward_train
            elsif choice == "2"
              move_backward_train
            end
        elsif choice == "5"
              set_manufacturer_train
        elsif choice == "6"
              get_manufacturer_train
        end
    elsif choice == "3"
      puts "Вывод текущих данных об объектах"
      puts "Введите 1, вывести список текущих поездов"
      puts "Введите 2, вывести список текущих станций"
      choice = gets.chomp
      if choice == "1"
        trains_info
      elsif choice == "2"
        stations_info
      end
    elsif choice == "0"
            main_menu
    elsif choice == "exit"
      exit
    end
  end

  private
  def new_train
    puts "Введите название поезда"
    train = gets.chomp
    puts "Введите номер поезда"
    number = gets.chomp
    puts "Выберите тип позда: passenger или cargo"
    type = gets.chomp
    carriage = 0
    if type == "passenger"
      train = PassengerTrain.new(number, carriage)
      puts "Пассажирский поезд:#{train},номер поезда:#{number} создан!"
      puts "Kol-vo passenger train: #{PassengerTrain.instances}"
    elsif type == "cargo"
      train = CargoTrain.new(number, carriage)
      puts "Грузовой поезд:#{train},номер поезда:#{number} создан!"
      puts "Kol-vo cargo train: #{CargoTrain.instances}"
    elsif raise "Wrong type of train!"
    end
    @trains << train
  end

  def new_station
    @route_list.each_with_index do |route, index|
      puts route
      puts index
    end
    puts 'Выберите маршрут'
    index = gets.chomp.to_f
    route = @route_list[index]
    puts 'Введите название новой станции'
    station_name = gets.chomp
    station = Station.new(station_name)
    @stations << station
    route.add_station(station)
    puts "Kol-vo station: #{Station.instances}"
    puts 'Станция создана!'
  end

  def delete_station
    @stations.each_with_index do |station, index|
      puts station
      puts index
    end
    puts 'Выберите станцию'
    index = gets.chomp.to_f
    station = @stations[index]
    @stations.delete(station)
  end

  def new_route
    puts "Введите название начальной станции"
    start_station = gets.chomp
    start_route = Station.new(start_station)
    puts "Введите название конечной станции"
    end_station = gets.chomp
    end_route = Station.new(end_station)
    raise "NO!" if start_route.class != Station && end_route.class != Station
    @route_list << Route.new(start_route, end_route)
    @stations << start_route
    @stations << end_route
    puts "Kol-vo routes: #{Route.instances}"
  end

  def set_route_to_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    @route_list.each_with_index do |route, index|
      puts route
      puts index
    end
    puts 'Выберите маршрут'
    index = gets.chomp.to_f
    route = @route_list[index]
    train.set_route(route)
  end

  def add_carriage_to_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    wagon = Wagon.new(train.type)
    train.add_carriage(wagon)
  end

  def remove_carriage_to_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.remove_carriage
  end

  def move_forward_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.move_forward
  end

  def move_backward_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.move_backward
  end

  def trains_info
    @trains.each_with_index do |train, index, carriage, type|
      puts "Индекс поезда: #{index}"
      puts "Тип поезда: #{train.type}"
      puts train.manufacturer_name
      puts train.carriage
    end
  end

  def stations_info
    @stations.each_with_index do |station, index, station_name|
      puts "Индекс станции: #{index}"
      puts "Название станции: #{station}"
    end
  end

  def show_trains
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
  end

  def set_manufacturer_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    puts "Введите название производителя поезда"
    name = gets.chomp
    train = @trains[index]
    train.set_manufacturer(name)
  end

  def get_manufacturer_train
    show_trains
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.manufacturer_name
  end
end
