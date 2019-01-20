class Main

  def initialize
    @trains = []
    @stations = []
    puts main_menu
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
      choice = gets.chomp
        if choice == "1"
          new_train
        elsif choice == "2"
          new_station
        elsif choice == "3"
          new_route
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
        trains
      elsif choice == "2"
        show_station
      end
    elsif choice == "0"
            main_menu
    elsif choice == "exit"
      exit
      system("clear")
    end
  end

  private

  def new_train

    puts "Введите название поезда"
    train = gets.chomp
    puts "Введите номер поезда"
    number = gets.chomp
    puts "Введите кол-во вагонов"
    carriage = gets.chomp
    puts "Выберите тип позда: Passenger или Cargo"
    type = gets.chomp
    if type == "Passenger"
      train = PassengerTrain.new(number,type,carriage)
      puts "Пассажирский поезд создан!"
    elsif type == "Cargo"
      train = Cargo_Train.new(number,carriage)
      puts "Грузовой поезд создан!"
    else "Введите корректные данные"
    end
    system('clear')
    show_menu
  end

  def new_station
    puts 'Введите название новой станции'
    station_name = gets.chomp
    station_name = Station.new(station_name)
    show_menu
  end

  def new_route
    puts "Введите название маршрута"
    route_name = gets.chomp
    puts "Введите название начальной станции"
    start_station = gets.chomp
    puts "Введите название конечной станции"
    end_station = gets.chomp
    route_name = Route.new(start_station, end_station)
    show_menu
  end

  def set_route_to_train
    puts "Введите название поезда"
    train = gets.chomp
    puts "Введите название маршрута"
    route_name = gets.chomp
    if
      @trains.include?(train) && @route_list.include?(route_name)
      @trains[train].set_route(route_name)
    else
      puts "Такой поезд или маршрут не существует."
    end
    show_menu
  end

  def add_carriage_to_train
    puts "Введите название поезда"
    train = gets.chomp
    if
      @trains.include?(train)
      @trains[train].add_carriage
    else
      puts "Такой поезд не существует."
    end
    show_menu
  end

  def remove_carriage_to_train
    puts "Введите название поезда"
    train = gets.chomp
    if
      @trains.include?(train)
      @trains[train].remove_carriage
    else
      puts "Такой поезд не существует."
    end
  end

  def move_forward_train
    puts "Введите название поезда"
    train = gets.chomp
    if
      @trains.include?(train)
      @trains[train].move_forward
    else
      puts "Такой поезд не существует."
    end
  end

  def move_backward_train
    puts "Введите название поезда"
    train = gets.chomp
    if
      @trains.include?(train)
      @trains[train].move_backward
    else
      puts "Такой поезд не существует."
    end
  end


  def show_menu
    loop do main_menu
    end
  end
end
