=begin
Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, который будет содержать общие методы и свойства
Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. В комментарии к методу обосновать, почему он был вынесен в private/protected
Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.
При добавлении вагона к поезду, объект вагона должен передаваться как аругмент метода и сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, где мы считали только кол-во вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.

Добавить текстовый интерфейс:

Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции
=end


class Main

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
          new_train
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
    puts "Введите кол-во вагонов"
    quantity = gets.chomp
    puts "Выберите тип позда: passenger или cargo"
    type = gets.chomp
    if type == "passenger"
      puts "Пассажирский поезд:#{train},номер поезда:#{number},кол-во вагонов:#{quantity} создан!"
      train = PassengerTrain.new(number, quantity)
      quantity.to_i.times do
        wagon = PassengerWagon.new(train.type)
        train.add_carriage(wagon)
      end
    elsif type == "cargo"
      puts "Грузовой поезд:#{train},номер поезда:#{number},кол-во вагонов:#{quantity} создан!"
      train = CargoTrain.new(number, quantity.to_f)
      quantity.to_i.times do
        wagon = CargoWagon.new(train.type)
        train.add_carriage(wagon)
      end
    else
      puts "Введите корректные данные"
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
    puts "Введите название конечной станции"
    end_station = gets.chomp
    @route_list << Route.new(start_station, end_station)
  end

  def set_route_to_train
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    @route_list.each_with_index do |route, index|
      puts route
      puts index
    end
    puts 'Выберите маршрут'
    index = gets.chomp.to_f
    train.set_route(@route_list[index])
  end

  def add_carriage_to_train
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    wagon = Wagon.new(train.type)
    train.add_carriage(wagon)
  end

  def remove_carriage_to_train
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.remove_carriage
  end

  def move_forward_train
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.move_forward
  end

  def move_backward_train
    @trains.each_with_index do |train, index|
      puts train
      puts index
    end
    puts 'Выберите поезд'
    index = gets.chomp.to_f
    train = @trains[index]
    train.move_backward
  end

  def trains_info
      @trains.each_with_index do |train, index, carriage, type|
        puts "Индекс поезда: #{index}"
        puts "Тип поезда: #{train.type}"
        puts train.carriage
      end
  end

  def stations_info
      @stations.each_with_index do |station, index, station_name|
        puts "Индекс станции: #{index}"
        puts "Название станции: #{station}"
      end
  end
end
