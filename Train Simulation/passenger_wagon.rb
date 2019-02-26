class PassengerWagon < Wagon
  attr_reader :type

  def initialize(amount)
    @type = :passenger
    @max_seats = amount
    @load_seats = 0
  end

  def passenger_load
    @load_seats += 1 if @load_seats < @max_seats
  end

  def passenger_loaded
    @load_seats
  end

  def passenger_empty
    empty_seats = @max_seats - @load_seats
    empty_seats
  end
end
